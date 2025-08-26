def calculate_rates(total_functions, flagged_functions, ground_truth_in_flagged):
    BER = ((total_functions - flagged_functions) / total_functions) * 100
    NER = ((total_functions - ground_truth_in_flagged) / total_functions) * 100
    return BER, NER

# Data structure: accelerator -> type -> (total, flagged, ground_truth)
accelerator_stats = {
    "Google Edge TPU": {
        # gasket_perform_mapping (VRC: 90%) 
        # (avg: VRC: 90%)
        "Relevant Functions": (159, 11, 1), 

        # gasket_handle_ioctl (GASKET_IOCTL_MAP_BUFFER, GASKET_IOCTL_MAP_BUFFER_FLAGS) (VRC: 90%)
        # (avg: VRC: 90%)
        "KD Entry Point": (159, 16, 7), 

         # gasket_map_buffers_flags (struct gasket_page_table_ioctl) (VRC: 90%)
         # (avg: VRC: 90%)
        "SMem Handling": (159, 15, 4),
    },
    "NXP NPU": {
        # _GFPAlloc (VRC: 80%), 
        # import_page_map(VRC: 90%) 
        # (avg: VRC: 85%)
        "Relevant Functions": (1273, 26, 1+1), 

        # gckVIDMEM_NODE_WrapUserMemory (gcvHAL_WRAP_USER_MEMORY) (VRC: 60%), 
        # gckVIDMEM_NODE_LockCPU (gcvHAL_LOCK_VIDEO_MEMORY) (VRC: 60%) 
        # (avg: VRC: 60%)
        "KD Entry Point": (1273, 7, 5), 

        # gckVIDMEM_NODE_WrapUserMemory (struct gcsUSER_MEMORY_DESC) (VRC: 80%), 
        # gcvHAL_LOCK_VIDEO_MEMORY (struct gcsHAL_LOCK_VIDEO_MEMORY) (VRC: 80%)[1] 
        # (avg: VRC: 80%)
        "SMem Handling": (1273, 25, 7), 
    },
    "TMMA": {
        # dma_heap_buffer_alloc (VRC: 80%)[1], 
        # dma_buf_phys_convert (VRC: 80%) 
        # (avg: VRC: 80%)
        "Relevant Functions": (6148, 7, 3), 

        # dma_heap_ioctl (DMA_HEAP_IOCTL_ALLOC) (VRC: 80%), 
        # dma_buf_phys_ioctl (DMA_BUF_PHYS_IOC_CONVERT) (VRC: 100%) 
        # (avg: VRC: 90%)
        "KD Entry Point": (6148, 14, 10), 

        # dma_buf_phys_ioctl (struct dma_buf_phys_data) (VRC: 100%), 
        # dma_heap_ioctl_allocate (struct dma_heap_allocation_data) (VRC: 100%) 
        # (avg: VRC: 100%)
        "SMem Handling": (6148, 23, 2), 
    },
    "AWS": {
        # mc_alloc_internal (VRC: 80%)
        # ncdev_mem_buf_copy (VRC: 70%)
        # ncdev_mem_get_pa (VRC: 80%)
        # (avg: VRC: 70%)
        "Relevant Functions": (381, 3, 4), 

        # ncdev_ioctl (NEURON_IOCTL_MEM_GET_PA, NEURON_IOCTL_MEM_ALLOC) (VRC: 90%)
        # (avg: VRC: 90%)
        "KD Entry Point": (381, 15, 9), 

        # ncdev_mem_get_pa_deprecated (struct neuron_ioctl_mem_get_pa) (VRC: 90%), 
        # ncdev_mem_buf_copy (struct neuron_ioctl_mem_buf_copy) (VRC: 100%), 
        # mc_alloc_internal (struct mem_chunk) (VRC: 80%)
        # (avg: VRC: 90%)
        "SMem Handling": (381, 23, 13), 
    },
}

# Store results for average calculation
category_results = {
    "Relevant Functions": {"BER": [], "NER": []},
    "KD Entry Point": {"BER": [], "NER": []},
    "SMem Handling": {"BER": [], "NER": []}
}

# Iterate and calculate
for acc, types in accelerator_stats.items():
    print(f"\n=== {acc} ===")
    for category, (total, flagged, ground_truth) in types.items():
        BER, NER = calculate_rates(total, flagged, ground_truth)
        print(f"{category}: BER = {flagged}({BER:.2f}%), NER = {ground_truth}({NER:.2f}%)")
        
        # Store results for averaging
        category_results[category]["BER"].append(BER)
        category_results[category]["NER"].append(NER)

# Calculate and print averages for each category
print("\n" + "="*50)
print("AVERAGE PERCENTAGES ACROSS ALL ACCELERATORS")
print("="*50)

for category, metrics in category_results.items():
    avg_ber = sum(metrics["BER"]) / len(metrics["BER"])
    avg_ner = sum(metrics["NER"]) / len(metrics["NER"])
    print(f"\n{category}:")
    print(f"  Average BER: {avg_ber:.2f}%")
    print(f"  Average NER: {avg_ner:.2f}%")
