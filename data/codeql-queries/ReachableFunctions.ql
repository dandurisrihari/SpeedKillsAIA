/**
 * @name Functions reachable from a driver's ioctl handlers
 * @description For every ioctl entry point in the snapshot, lists the functions
 *              reachable from it through the call graph, giving the static attack
 *              surface behind `ioctl(2)` broken down per handler. A single entry
 *              point can be pinned with `targetFunctionName()`.
 * @kind table
 * @id cpp/reachable-functions
 * @tags call-graph
 *       attack-surface
 */

import cpp

/*
 * ---------------------------------------------------------------------------
 * Configuration
 * ---------------------------------------------------------------------------
 */

/**
 * Gets a single function to start the traversal from, or `""` to use every ioctl
 * handler `isIoctlEntryPoint` can find.
 */
string targetFunctionName() { result = "" }

/**
 * Holds if functions merely *named* like an ioctl handler are treated as entry
 * points, on top of the ones found in dispatch tables.
 *
 * Off by default because the name is a poor signal: a `TRACE_EVENT(ioctl_mem_alloc)`
 * expands to dozens of `trace_ioctl_mem_alloc`-style tracepoint functions, and a
 * full-kernel snapshot adds the VFS's own `vfs_ioctl`/`compat_ptr_ioctl`. Enable
 * it, with a narrow `sourcePathPattern()`, when a driver registers its handler
 * through a macro the extractor cannot see into.
 */
predicate includeNameMatchedRoots() { none() }

/**
 * Holds if functions with no body in this snapshot are dropped from the report.
 *
 * Removes symbols the driver only links against, such as `_printk`, which no
 * source-level tool could ever instrument. It does *not* restrict the report to
 * driver code: most kernel helpers are `static inline` in headers and so do carry
 * a body. Use `sourcePathPattern()` for that; the two filters are complementary.
 */
predicate requireDefinition() { any() }

/**
 * Gets a `matches`-style pattern limiting which files the analysed code may come
 * from, e.g. `"%/hailort-drivers/%"`. It scopes both the entry points and the
 * reported functions.
 *
 * The wildcards are SQL's, not the shell's: `%` is any run of characters and `_`
 * is exactly one. Matching is against the absolute path.
 *
 * `"%"` covers everything. Narrow it to the driver tree to keep the kernel's own
 * ioctl plumbing from becoming an entry point, and to make the result comparable
 * with a dynamic baseline, which can only observe driver functions and never the
 * inlined kernel helpers they call.
 */
string sourcePathPattern() { result = "%" }

/**
 * Holds if a root definition may live in `f`.
 *
 * `any()` accepts every file. Narrow it when several translation units define a
 * `static` entry point with the same name, e.g. `f.getBaseName() = "fops.i"`.
 */
predicate isRootFile(File f) { any() }

/**
 * Holds if `f` should be left out of the call graph entirely.
 *
 * Compiler intrinsics such as `__builtin_expect` have no body and no source
 * location, so they only add noise. Extend this to prune other uninteresting
 * code, for example kernel assertion helpers.
 */
predicate isExcluded(Function f) { f instanceof BuiltInFunction }

/**
 * Holds if taking a function's address counts as reaching it.
 *
 * Registering a callback (`.unlocked_ioctl = handler`) or passing a function
 * pointer as an argument makes that function callable, so for attack-surface
 * work it is normally treated as reachable. Set to `none()` for a strict
 * "definitely invoked" call graph.
 */
predicate includeAddressTakenEdges() { any() }

/**
 * Holds if calls through a struct field (`ops->read(...)`) are resolved to the
 * functions stored in that field anywhere in the snapshot.
 *
 * Field-sensitive and therefore reasonably precise, but it ignores which object
 * the field belongs to, so separate instances of the same struct are conflated.
 */
predicate includeFieldMatchedIndirectCalls() { any() }

/**
 * Holds if the remaining function-pointer calls are resolved to every
 * address-taken function with a matching signature.
 *
 * Disabled by default: C signatures are widely shared, so this over-approximates
 * heavily. Enable it (`any()`) when a deliberately conservative upper bound on
 * the reachable set is wanted.
 */
predicate includeTypeMatchedIndirectCalls() { none() }

/**
 * Gets the longest call chain the depth column is computed for. Reachability
 * itself is unbounded, so the list of functions is complete either way; only the
 * depth of unusually deep functions is affected. Raise this if `unknownDepth()`
 * shows up in the results.
 */
int maxReportedDepth() { result = 64 }

/**
 * Gets the depth reported when the shortest chain is longer than
 * `maxReportedDepth()`.
 *
 * Negative so it cannot be mistaken for a real depth, at the cost of sorting
 * ahead of depth 0 in the output.
 */
int unknownDepth() { result = -1 }

/*
 * ---------------------------------------------------------------------------
 * Call graph
 * ---------------------------------------------------------------------------
 */

/**
 * Holds if the body of `caller` contains a statically resolved call to `callee`.
 *
 * `getTarget()` only exists for calls the extractor could resolve to a named
 * function; calls through a pointer are `ExprCall`s and are handled further down.
 */
private predicate directCall(Function caller, Function callee) {
  exists(FunctionCall call | call.getEnclosingFunction() = caller and call.getTarget() = callee)
}

/**
 * Holds if the body of `caller` mentions `callee` as a value rather than calling
 * it, and could plausibly go on to invoke it.
 *
 * A `FunctionAccess` is the bare use of a function name where no call happens:
 * storing it in an ops table, passing it as a callback, comparing against it.
 * That alone does not make `caller` run `callee` — a body with no indirect call
 * site is registering the callback for someone else to invoke, and the edge that
 * matters is the one out of that other function. Requiring an `ExprCall` here
 * keeps the pure-registration case from inflating the reachable set.
 */
private predicate addressTaken(Function caller, Function callee) {
  includeAddressTakenEdges() and
  exists(FunctionAccess access |
    access.getEnclosingFunction() = caller and access.getTarget() = callee
  ) and
  exists(ExprCall indirect | indirect.getEnclosingFunction() = caller)
}

/**
 * Holds if `callee`'s address is stored into `field`, by a struct initializer or
 * by a later assignment.
 *
 * Operation tables are initialised at file scope and so have no enclosing
 * function, which is why this is not expressed as an edge out of some caller.
 */
private predicate fieldHoldsFunction(Field field, Function callee) {
  // ClassAggregateLiteral covers C designated initializers, `.unlocked_ioctl = h`.
  exists(ClassAggregateLiteral init |
    // getAChild*() steps through any casts and parentheses wrapping the name.
    init.getAFieldExpr(field).getAChild*().(FunctionAccess).getTarget() = callee
  )
  or
  exists(AssignExpr assign |
    assign.getLValue().(FieldAccess).getTarget() = field and
    assign.getRValue().getAChild*().(FunctionAccess).getTarget() = callee
  )
}

/** Holds if `caller` calls a function pointer held in a field that stores `callee`. */
private predicate fieldMatchedIndirectCall(Function caller, Function callee) {
  includeFieldMatchedIndirectCalls() and
  exists(ExprCall call, FieldAccess calleePointer |
    call.getEnclosingFunction() = caller and
    // getUnconverted() undoes the implicit lvalue-to-rvalue step so the field read
    // itself is visible instead of the conversion node wrapping it.
    calleePointer = call.getExpr().getUnconverted() and
    fieldHoldsFunction(calleePointer.getTarget(), callee)
  )
}

/** A function whose address is taken somewhere, and which is therefore a possible indirect target. */
private class AddressTakenFunction extends Function {
  AddressTakenFunction() { exists(FunctionAccess access | access.getTarget() = this) }
}

/**
 * Holds if `signature` has the same return type and parameter types as `f`.
 *
 * `getUnspecifiedType()` resolves typedefs and drops `const`/`volatile`, so
 * `hailo_dev *` and `struct hailo_dev * const` compare equal.
 */
private predicate signatureMatches(RoutineType signature, Function f) {
  // RoutineType has no arity accessor, so the parameter indices are counted instead.
  count(int i | exists(signature.getParameterType(i))) = f.getNumberOfParameters() and
  signature.getReturnType().getUnspecifiedType() = f.getType().getUnspecifiedType() and
  forall(int i, Type parameter | parameter = signature.getParameterType(i) |
    parameter.getUnspecifiedType() = f.getParameter(i).getType().getUnspecifiedType()
  )
}

/** Holds if `caller` makes an indirect call whose signature matches `callee`. */
private predicate typeMatchedIndirectCall(Function caller, Function callee) {
  includeTypeMatchedIndirectCalls() and
  callee instanceof AddressTakenFunction and
  exists(ExprCall call |
    call.getEnclosingFunction() = caller and
    // The called expression is a pointer to a function type; peel it back to the
    // RoutineType that describes the signature actually being invoked.
    signatureMatches(call.getExpr()
          .getUnderlyingType()
          .(FunctionPointerType)
          .getBaseType()
          .getUnspecifiedType(), callee)
  )
}

/** Holds if control can pass from `caller` into `callee`. */
predicate callEdge(Function caller, Function callee) {
  not isExcluded(callee) and
  (
    directCall(caller, callee)
    or
    addressTaken(caller, callee)
    or
    fieldMatchedIndirectCall(caller, callee)
    or
    typeMatchedIndirectCall(caller, callee)
  )
}

/*
 * ---------------------------------------------------------------------------
 * Entry points
 *
 * Drivers register ioctl handlers in several shapes, so each one is matched
 * separately and the results unioned.
 * ---------------------------------------------------------------------------
 */

/** Holds if `f` is within the tree being analysed. */
predicate isInScope(Function f) {
  f.getFile().getAbsolutePath().matches(sourcePathPattern())
}

/** Holds if `name` reads as an ioctl-related identifier. */
bindingset[name]
private predicate mentionsIoctl(string name) { name.toLowerCase().matches("%ioctl%") }

/**
 * Holds if `f` is registered as an ioctl handler anywhere in the snapshot.
 *
 * The three cases are, in order: a slot named after ioctl (`file_operations`
 * `.unlocked_ioctl`/`.compat_ioctl`/`.ioctl`, `proc_ops.proc_ioctl`); any slot of
 * a table that is itself an ioctl table, whose members are not individually named
 * for it (`drm_ioctl_desc.func`, the `vidioc_*` members of `v4l2_ioctl_ops`); and
 * a handler recognisable only by its own name.
 */
predicate isIoctlEntryPoint(Function f) {
  exists(Field slot | fieldHoldsFunction(slot, f) |
    mentionsIoctl(slot.getName())
    or
    mentionsIoctl(slot.getDeclaringType().getName())
  )
  or
  includeNameMatchedRoots() and mentionsIoctl(f.getName())
}

/**
 * Gets a function the traversal starts from.
 *
 * This is a set, not a single value. `hasDefinition()` drops the bodyless header
 * declarations that would otherwise match too.
 */
Function rootFunction() {
  result.hasDefinition() and
  isRootFile(result.getFile()) and
  isInScope(result) and
  (
    result.getName() = targetFunctionName()
    or
    targetFunctionName() = "" and isIoctlEntryPoint(result)
  )
}

/*
 * ---------------------------------------------------------------------------
 * Reachability
 * ---------------------------------------------------------------------------
 */

/**
 * Holds if `f` is `root` itself or is transitively reachable from it.
 *
 * `+` is transitive closure: one or more `callEdge` hops. It terminates on
 * recursive and mutually recursive code because it is a fixpoint over a finite
 * set of functions, so no cycle handling is needed here.
 */
predicate reachableFrom(Function root, Function f) {
  root = rootFunction() and
  (
    f = root
    or
    callEdge+(root, f)
  )
}

/** Holds if `f` is reachable from at least one entry point. */
predicate reachable(Function f) { reachableFrom(_, f) }

/** Holds if `f` is reachable and belongs in the report. */
predicate reportable(Function f) {
  reachable(f) and
  isInScope(f) and
  (requireDefinition() implies f.hasDefinition())
}

/*
 * ---------------------------------------------------------------------------
 * Shortest call depth
 *
 * `reachableFrom` already answers the yes/no question. This section re-walks the
 * graph a second time carrying a hop counter, which is why it needs an explicit
 * bound: unlike transitive closure, counting recursion has no natural fixpoint.
 * ---------------------------------------------------------------------------
 */

private predicate reachableAtDepth(Function root, Function f, int depth) {
  root = rootFunction() and f = root and depth = 0
  or
  depth in [1 .. maxReportedDepth()] and
  exists(Function caller | reachableAtDepth(root, caller, depth - 1) and callEdge(caller, f))
}

/** Gets the fewest call-graph hops between `root` and `f`. */
private int shortestCallDepth(Function root, Function f) {
  reachableFrom(root, f) and
  (
    result = min(int depth | reachableAtDepth(root, f, depth) | depth)
    or
    // Reachable, but every chain to it is longer than the bound above.
    not reachableAtDepth(root, f, _) and result = unknownDepth()
  )
}

/*
 * ---------------------------------------------------------------------------
 * Reporting
 *
 * One row per (entry point, function name) pair, so the table splits into a
 * block per ioctl handler. A function declared in a header is extracted once per
 * translation unit, so reporting `Function` entities directly would repeat
 * external names such as `_printk` once for every `.c` file.
 *
 * `hasBody` and `declaredAt` are properties of the function itself, so they are
 * computed once over the whole reachable set rather than per entry point.
 * ---------------------------------------------------------------------------
 */

/**
 * Gets `f`'s source position as `path:line`, choosing one when it has several.
 *
 * A function can carry more than one `Location`; `min` just picks one of them
 * deterministically so the result stays single-valued.
 */
private string positionOf(Function f) {
  result =
    min(Location l |
      l = f.getLocation()
    |
      l.getFile().getAbsolutePath() + ":" + l.getStartLine().toString()
    )
}

/** Holds if a reachable function named `name` is defined at `position`. */
private predicate definitionOf(string name, string position) {
  exists(Function f |
    reportable(f) and f.hasDefinition() and name = f.getName() and position = positionOf(f)
  )
}

/** Holds if a reachable function named `name` is declared at `position`. */
private predicate declarationOf(string name, string position) {
  exists(Function f | reportable(f) and name = f.getName() and position = positionOf(f))
}

/**
 * Gets where `name` comes from: every definition site when the function has a
 * body in this snapshot, otherwise a single representative declaration site.
 *
 * Distinct definition sites are all kept, because two `static` functions in
 * different translation units can legitimately share a name.
 */
private string originOf(string name) {
  definitionOf(name, _) and
  result = concat(string position | definitionOf(name, position) | position, ", " order by position)
  or
  not definitionOf(name, _) and
  result = min(string position | declarationOf(name, position) | position)
}

/** Holds if a function named `name` is reachable from the entry point named `entryPoint`. */
private predicate reachedFrom(string entryPoint, string name) {
  exists(Function root, Function f |
    reachableFrom(root, f) and reportable(f) and entryPoint = root.getName() and name = f.getName()
  )
}

from string entryPoint, string name, int depth, string hasBody, string origin
where
  reachedFrom(entryPoint, name) and
  // Several extracted functions can share a name, so the row reports the depth of
  // whichever copy sits closest to this entry point.
  depth =
    min(Function root, Function f |
      reachableFrom(root, f) and
      reportable(f) and
      root.getName() = entryPoint and
      f.getName() = name
    |
      shortestCallDepth(root, f)
    ) and
  // "no" means the snapshot only has a prototype: an external symbol the driver
  // links against, such as a kernel export.
  (if definitionOf(name, _) then hasBody = "yes" else hasBody = "no") and
  origin = originOf(name)
select entryPoint, name as functionName, depth as callDepth, hasBody, origin as declaredAt
  order by entryPoint asc, callDepth asc, functionName asc
