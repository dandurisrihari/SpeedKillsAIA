# Static ioctl Attack-Surface Extraction: Design

Design notes for `ReachableFunctions.ql` and `run-reachability.sh`. All figures
reported here were measured on the six accelerator-driver CodeQL databases in
`data/codeql-dbs/` (CodeQL 2.26.2, `codeql/cpp-all` 12.0.1).

## 1. Problem

Given a compiled accelerator driver, enumerate the functions an unprivileged
userspace process can cause to execute through `ioctl(2)`. This is the static
counterpart to the runtime coverage recorded by the kernel instrumenter, and it
serves two purposes: bounding the region an auditor must review, and providing a
reference set against which dynamic coverage can be judged.

The analysis must be driver-agnostic. Hand-naming entry points does not scale
across vendors and silently under-reports whenever a driver exposes more than one
character device — in our corpus, three of six databases do.

## 2. Model

Let $F$ be the functions in the database and $E \subseteq F \times F$ the call
relation of Section 3. For an entry point $r$,

$$\mathrm{Reach}(r) = \{r\} \cup \{f \in F \mid (r,f) \in E^{+}\}$$

where $E^{+}$ is the transitive closure. Closure over a finite $F$ is a
least-fixpoint computation, so recursion and mutual recursion terminate without
special handling. The reported attack surface is $\bigcup_{r \in R}\mathrm{Reach}(r)$
for the inferred entry-point set $R$ (Section 4), retaining the per-$r$
decomposition so that each handler's contribution stays separable.

For presentation we also compute a bounded shortest depth

$$d(r,f) = \min\{n \le D \mid (r,f) \in E^{n}\},\qquad D = 64$$

reported as $-1$ when no chain of length $\le D$ exists. Depth is diagnostic
only; reachability itself is unbounded, so the function set is unaffected by $D$.
The deepest chain observed across the corpus was 20 hops (NVIDIA), and no row hit
the bound.

## 3. Call-graph construction

C drivers dispatch predominantly through function pointers, so a call graph built
from statically resolved calls alone is severely incomplete. Four edge relations
are defined, each independently toggleable, trading precision for recall:

| Relation | Edge $(a,b)$ when | Character |
|---|---|---|
| `directCall` | `a`'s body contains a `FunctionCall` whose target is `b` | Exact |
| `addressTaken` | `a`'s body mentions `b` as a value **and** contains an indirect call site | Over-approximate: the call site need not be the one reaching `b` |
| `fieldMatchedIndirectCall` | `a` calls `p->fld(...)` and `b` is stored into `fld` anywhere | Field-sensitive, instance-insensitive |
| `typeMatchedIndirectCall` | `a` makes any indirect call whose signature matches address-taken `b` | Heavily over-approximate; **off** by default |

The indirect-call precondition on `addressTaken` matters. Mentioning a function
by name is not invoking it: a body that stores a callback into an operation table
and returns cannot run that callback, and the edge that does matter is the one out
of whichever function later dispatches through the table — already covered by
`fieldMatchedIndirectCall`. Requiring the enclosing body to contain at least one
`ExprCall` removes the pure-registration case, which is otherwise a large source
of spurious reachability in driver `probe` paths.

`fieldHoldsFunction` recovers the pointer-to-field binding from both designated
initializers (`ClassAggregateLiteral`, the shape kernel operation tables take) and
later assignments. Because operation tables are initialized at file scope, this
binding has no enclosing function and cannot be expressed as an edge out of a
caller; it is therefore modelled as a separate relation and joined at the call
site.

The default configuration enables the first three. `typeMatchedIndirectCall` is
disabled because C signatures are widely shared across a kernel tree; it is
retained as a deliberate upper bound.

### 3.1 Sensitivity

Union of reachable functions under each edge set, at the default scope:

| Edge set | Hailo | NVIDIA | TI |
|---|---:|---:|---:|
| `directCall` only | 126 | 1 558 | 104 |
| `+ addressTaken` | 126 | 1 774 | 104 |
| `+ fieldMatchedIndirectCall` | 129 | 4 182 | 158 |
| All three (default) | **129** | **4 234** | **158** |

Three observations matter for interpretation. First, the spread is highly
driver-dependent: Hailo varies by 2.4 % across the whole lattice, NVIDIA by
2.7$\times$ and TI by 1.5$\times$. Second, the dominant term is field-matched
indirect resolution, not address-taken registration — on NVIDIA it contributes
roughly 60 % of the reachable set, a direct consequence of `nvgpu`'s large HAL
operation tables, whose instance-insensitive treatment conflates every GPU
generation's implementation of a given slot. Third, once gated, `addressTaken`
contributes nothing at all on Hailo or TI and only 216 functions on NVIDIA,
confirming that its apparent value before gating was almost entirely
pure-registration noise. Any absolute figure should therefore be reported together
with its edge configuration.

## 4. Entry-point inference

Entry points are recovered from registration structure rather than from naming.
A function $f$ is an ioctl entry point if it is stored into a field `slot` where
either

1. `slot`'s own name mentions ioctl — covering `file_operations.unlocked_ioctl`,
   `.compat_ioctl`, the legacy `.ioctl`, and `proc_ops.proc_ioctl`; or
2. `slot`'s declaring type mentions ioctl — covering tables whose members are not
   individually named for it, such as `drm_ioctl_desc.func` and the `vidioc_*`
   members of `v4l2_ioctl_ops`.

Both cases reuse `fieldHoldsFunction`, so registration by initializer and by
assignment are handled uniformly. The two rules recover entry points across all
six databases with no per-driver configuration:

| Database | Entry points | Reachable (union) |
|---|---:|---:|
| AWS Neuron | 1 | 441 |
| Coral / Gasket | 2 | 84 |
| Hailo | 1 | 129 |
| NVIDIA | 11 | 4 234 |
| NXP | 11 | 563 |
| TI | 10 | 158 |

Every root recovered across the corpus is a `file_operations` slot, a
`gasket_driver_desc.ioctl_handler_cb`, or a `drm_ioctl_desc.func`; rule 2 fires
only for NXP's DRM table. Three databases contain several independent drivers
(NVIDIA: `nvgpu` plus `nvmap`; TI: `dma_buf`, `dma_heap`, `sync_file`, `rpmsg`,
`uacce` and others; NXP: `drv_ioctl` plus ten `viv_ioctl_gem_*` handlers).
Per-handler decomposition is preserved rather than collapsed, since the handlers
carry different privilege requirements.

The TI row deserves a caveat when quoted: its handlers belong to generic kernel
subsystems built into the TI board-support kernel, not to a single accelerator
driver. It measures the ioctl surface of that kernel's built driver set.

### 4.1 Rejected alternative: name-based inference

Treating any function whose identifier contains `ioctl` as an entry point is the
obvious heuristic and is unusable. On AWS Neuron it yields 89 entry points, of
which only 4 are genuine (`ncdev_ioctl` and three sub-handlers); the remaining 85
are stubs generated by `TRACE_EVENT(ioctl_mem_alloc, …)` and similar macros —
`trace_ioctl_mem_alloc`, `perf_trace_ioctl_mem_alloc`, `__bpf_trace_ioctl_mem_alloc`
— which inflate the union from 441 to 522 (+18.4 %) while contributing no attack
surface. On a full-kernel database the same rule additionally admits the VFS's own
`vfs_ioctl` and `compat_ptr_ioctl`.

The rule is retained behind `includeNameMatchedRoots()`, disabled by default, for
drivers whose registration is hidden behind a macro the extractor cannot see
through. It should be used only with a narrow path scope and with the reported
entry-point list inspected.

## 5. Scope control

Two independent filters restrict what is reported. Neither subsumes the other,
and the distinction is easy to get wrong.

`requireDefinition()`, enabled by default, drops functions with no body in the
snapshot — symbols the driver only links against, such as `_printk`. No
source-level instrumentation can observe these, so they do not belong in a
coverage baseline.

`sourcePathPattern()` constrains both entry points and reported functions to a
set of path patterns; a file is in scope if it matches any of them. Each database
is scoped to the driver's **own subtree**, not to the checkout containing it. That
distinction is load-bearing for the in-tree drivers: NXP and TI ship a complete
vendor kernel, so scoping to the checkout counts several hundred `static inline`
functions from `include/` and `arch/` as driver code — 46 % of the NXP total and
63 % of the TI total before the subtree scopes were applied. A single pattern is
also not always enough: NVIDIA needs two, because `nvgpu` and `nvmap` are separate
trees inside the L4T release and scoping to `nvgpu` alone silently discards the
`nvmap_ioctl` entry point.

Critically, **having a body does not mean being driver code.** Most kernel helpers
are `static inline` in headers and are therefore extracted with bodies: of Hailo's
252 body-carrying reachable functions, 123 are defined under
`/usr/src/linux-headers-*`. Only the path filter removes them.

| Database | Reachable | ∩ has body | ∩ driver subtree |
|---|---:|---:|---:|
| AWS Neuron | 674 | 554 | 441 |
| Coral / Gasket | 261 | 174 | 84 |
| Hailo | 352 | 252 | 129 |
| NVIDIA | 4 970 | 4 559 | 4 234 |
| NXP | 974 | 819 | 563 |
| TI | 571 | 433 | 158 |

The body filter alone overstates the driver-resident surface by 1.1–2.7$\times$;
TI is the extreme, at 433 against 158. After both filters, 0–8 % of each reported
set comes from `.h` files, and those are the drivers' own headers rather than the
kernel's.

Reported functions are keyed by name rather than by `Function` entity: a function
declared in a header is extracted once per translation unit, so entity-level
reporting repeats external symbols such as `_printk` once per `.c` file.

## 6. Output

One row per (entry point, function) pair:

| Column | Meaning |
|---|---|
| `entryPoint` | ioctl handler the row is attributed to |
| `functionName` | reachable function |
| `callDepth` | shortest hops from that entry point ($-1$ if $> D$) |
| `hasBody` | `no` marks a prototype-only symbol; constant `yes` while `requireDefinition()` is on |
| `declaredAt` | `path:line`; all definition sites when several exist |

`hasBody` and `declaredAt` are properties of the function, not of the path, and
are computed once over the whole reachable set.

## 7. Limitations

- **Instance insensitivity.** Field-matched resolution ignores which object a
  field belongs to, conflating distinct instances of the same structure type.
  Section 3.1 quantifies the effect.
- **Registration is not invocation.** `addressTaken` requires the enclosing body
  to contain an indirect call site, which removes pure-registration functions. It
  does not check that the call site is the one reaching the referenced function,
  so a body that both registers a callback and dispatches through an unrelated
  pointer still yields the edge.
- **Configuration-dependent extraction.** The database records one build
  configuration; code excluded by `#ifdef` at build time is absent from the graph.
- **Neither sound nor complete.** The analysis is a configurable approximation.
  The direct-call row of Section 3.1 is the practical lower bound and the
  all-edges row the practical upper bound; enabling `includeTypeMatchedIndirectCalls()`
  yields a looser but more conservative bound.
- **Overlapping decompositions.** Handlers may dispatch into one another, so
  per-handler counts overlap and must not be summed. On Coral, `apex_ioctl`'s 7
  functions are a subset of `gasket_ioctl`'s 84, reached through
  `ioctl_handler_cb`. The union is the meaningful aggregate.

## 8. Reproduction

```bash
cd data/codeql-queries
codeql pack install
./run-reachability.sh                        # every database, into results/<name>/
./run-reachability.sh ../codeql-dbs/hailo-codeql-db
```

Each database is scoped automatically: `db_filter()` in the runner maps a database
to the path patterns of its driver subtree. Each run deletes prior results before
writing. Per database the runner emits `reachable-functions.csv` (the table
above), `reachable-by-entrypoint.txt` (the same data blocked by handler), and
`reachable-functions.txt` (the deduplicated union); for the run as a whole it
emits `results/summary.csv`, one row per database, and `results/summary.txt` with
the column definitions. `TARGET_FUNCTION` pins a single entry point;
`SOURCE_FILTER` overrides the path scope with a space-separated pattern list. Both
rewrite a throwaway copy of the query, leaving the checked-in defaults intact.
