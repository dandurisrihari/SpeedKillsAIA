#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Analysis/LoopAnalysisManager.h"
#include "llvm/Analysis/CGSCCPassManager.h"
#include <unordered_set>
#include <string>

using namespace llvm;

namespace {

class DMACallFinderPass : public PassInfoMixin<DMACallFinderPass> {
private:
    std::unordered_set<std::string> dmaAPIs = {
        // Allocation APIs
        "dma_alloc_coherent", "dma_alloc_attrs", "dma_alloc_wc",
        "dma_alloc_noncoherent", "dma_zalloc_coherent",
        "pci_alloc_consistent", "pci_zalloc_consistent",
        "dmam_alloc_coherent", "dmam_alloc_attrs",
        "__dma_alloc_coherent", "arm_dma_alloc",

        // DMA Pool APIs
        "dma_pool_create", "dma_pool_destroy",
        "dma_pool_alloc", "dma_pool_zalloc", "dma_pool_free",

        // Mapping APIs (Streaming)
        "dma_map_single", "dma_unmap_single",
        "dma_map_page", "dma_unmap_page",
        "dma_map_sg", "dma_unmap_sg",
        "dma_sync_single_for_cpu", "dma_sync_single_for_device",
        "dma_sync_sg_for_cpu", "dma_sync_sg_for_device",
        "dma_mapping_error",

        // dma-buf APIs (Shared Buffers)
        "dma_buf_export", "dma_buf_fd", "dma_buf_get", "dma_buf_put",
        "dma_buf_attach", "dma_buf_detach",
        "dma_buf_map_attachment", "dma_buf_unmap_attachment",
        "dma_buf_begin_cpu_access", "dma_buf_end_cpu_access",
        "dma_buf_begin_cpu_access_partial", "dma_buf_end_cpu_access_partial",
        "dma_buf_mmap", "dma_buf_kmap", "dma_buf_kunmap",
        "dma_buf_kmap_atomic", "dma_buf_kunmap_atomic",
        "dma_buf_vmap", "dma_buf_vunmap",

        // DMA Engine APIs
        "dma_request_channel", "dma_release_channel",
        "dmaengine_submit", "dma_async_issue_pending",
        "dmaengine_prep_slave_single", "dmaengine_prep_slave_sg",
        "dmaengine_prep_interleaved_dma", "dmaengine_prep_dma_memcpy",
        "dmaengine_prep_dma_cyclic",
        "dmaengine_terminate_all",
        "dmaengine_desc_get_callback",
        "dmaengine_desc_set_callback", "dmaengine_desc_set_callback_param",

        // Scatterlist DMA APIs
        "sg_page_iter_dma_address", "sg_dma_address", "sg_dma_len",
        "sg_phys", "sg_page_iter_page", "sg_page_iter_dma_len",
        "for_each_sg_page", "for_each_sg_dma_page",

        // Address Translation APIs
        "dma_to_phys", "phys_to_dma", "virt_to_phys", "phys_to_virt",
        "virt_to_bus", "bus_to_virt", "page_to_phys", "pfn_to_phys",
        "phys_to_pfn", "virt_to_page", "page_to_virt",

        // Memory Mapping APIs
        "ioremap", "ioremap_nocache", "ioremap_wc", "ioremap_wt",
        "ioremap_cache", "iounmap", "devm_ioremap", "devm_iounmap",
        "devm_ioremap_resource", "devm_platform_ioremap_resource",

        // PCI Resource APIs
        "pci_resource_start", "pci_resource_end", "pci_resource_len",
        "pci_resource_flags", "pci_iomap", "pci_iounmap",
        "pcim_iomap", "pcim_iounmap", "pcim_iomap_regions",

        // Misc DMA APIs
        "dma_supported", "dma_get_cache_alignment",
        "dma_set_mask", "dma_set_coherent_mask",
        "dma_get_required_mask",
        "dma_get_sgtable", "dma_mmap_attrs"
    };

    void printCallSiteInfo(CallBase *call) {
        Function *calledFunc = call->getCalledFunction();
        Function *callerFunc = call->getFunction();
        
        errs() << "Found DMA API call: " << calledFunc->getName();
        
        if (callerFunc) {
            errs() << " in function: " << callerFunc->getName();
        }
        
        // Try to get debug information
        if (const DebugLoc &debugLoc = call->getDebugLoc()) {
            errs() << " at line " << debugLoc.getLine();
            if (auto *scope = debugLoc.getScope()) {
                if (auto *file = dyn_cast<DIFile>(scope)) {
                    errs() << " in file: " << file->getFilename();
                } else if (auto *subprogram = dyn_cast<DISubprogram>(scope)) {
                    if (auto *file = subprogram->getFile()) {
                        errs() << " in file: " << file->getFilename();
                    }
                } else if (auto *lexblock = dyn_cast<DILexicalBlock>(scope)) {
                    if (auto *file = lexblock->getFile()) {
                        errs() << " in file: " << file->getFilename();
                    }
                }
            }
        }
        
        errs() << "\n";
        
        // Print arguments count
        errs() << "  Arguments: " << call->arg_size() << "\n";
        
        // Print argument types
        for (unsigned i = 0; i < call->arg_size(); ++i) {
            Value *arg = call->getArgOperand(i);
            errs() << "    Arg " << i << ": ";
            arg->getType()->print(errs());
            errs() << "\n";
        }
        
        errs() << "\n";
    }

    void printIndirectCallSiteInfo(CallBase *call, const std::string &calledName) {
        Function *callerFunc = call->getFunction();
        
        errs() << "Found indirect DMA API call: " << calledName;
        
        if (callerFunc) {
            errs() << " in function: " << callerFunc->getName();
        }
        
        // Try to get debug information
        if (const DebugLoc &debugLoc = call->getDebugLoc()) {
            errs() << " at line " << debugLoc.getLine();
            if (auto *scope = debugLoc.getScope()) {
                if (auto *file = dyn_cast<DIFile>(scope)) {
                    errs() << " in file: " << file->getFilename();
                } else if (auto *subprogram = dyn_cast<DISubprogram>(scope)) {
                    if (auto *file = subprogram->getFile()) {
                        errs() << " in file: " << file->getFilename();
                    }
                } else if (auto *lexblock = dyn_cast<DILexicalBlock>(scope)) {
                    if (auto *file = lexblock->getFile()) {
                        errs() << " in file: " << file->getFilename();
                    }
                }
            }
        }
        
        errs() << "\n";
        
        // Print arguments count
        errs() << "  Arguments: " << call->arg_size() << "\n";
        
        errs() << "\n";
    }

public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        errs() << "Running DMA Call Finder Pass on module: " << M.getName() << "\n";
        errs() << "============================================\n";
        
        int totalCallSites = 0;
        
        for (Function &F : M) {
            if (F.isDeclaration()) continue;
            
            for (BasicBlock &BB : F) {
                for (Instruction &I : BB) {
                    if (CallBase *call = dyn_cast<CallBase>(&I)) {
                        Function *calledFunc = call->getCalledFunction();
                        
                        if (calledFunc && dmaAPIs.count(calledFunc->getName().str())) {
                            printCallSiteInfo(call);
                            totalCallSites++;
                        } else if (!calledFunc) {
                            // Handle indirect calls - check if the called value has a name
                            Value *calledValue = call->getCalledOperand();
                            if (calledValue && calledValue->hasName()) {
                                std::string calledName = calledValue->getName().str();
                                if (dmaAPIs.count(calledName)) {
                                    printIndirectCallSiteInfo(call, calledName);
                                    totalCallSites++;
                                }
                            }
                        }
                    }
                }
            }
        }
        
        errs() << "============================================\n";
        errs() << "Total DMA API call sites found: " << totalCallSites << "\n\n";
        
        return PreservedAnalyses::all();
    }
};

} // end anonymous namespace

// New PM Registration
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return {
        .APIVersion = LLVM_PLUGIN_API_VERSION,
        .PluginName = "DMACallFinder",
        .PluginVersion = "v0.1",
        .RegisterPassBuilderCallbacks = [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "dma-call-finder") {
                        MPM.addPass(DMACallFinderPass());
                        return true;
                    }
                    return false;
                });
        }};
}