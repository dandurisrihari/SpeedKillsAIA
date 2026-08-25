def calculate_rates(total_functions, flagged_functions, ground_truth_in_flagged):
    BER = ((total_functions - flagged_functions) / total_functions) * 100
    NER = ((total_functions - ground_truth_in_flagged) / total_functions) * 100
    return BER, NER

# Data structure: accelerator -> type -> (total, flagged, ground_truth)
accelerator_stats = {
    "Google Edge TPU": {
        # gasket_perform_mapping (VRC: 90%) 
        # (avg: VRC: 90%)
        "Relevant Functions": (159, 12, 1), 

        # gasket_handle_ioctl (GASKET_IOCTL_MAP_BUFFER, GASKET_IOCTL_MAP_BUFFER_FLAGS) (VRC: 90%)
        # (avg: VRC: 90%)
        "KD Entry Point": (159, 16, 9), 

         # gasket_map_buffers_flags (struct gasket_page_table_ioctl_flags) (VRC: 80%)
         # (avg: VRC: 80%)
        "SMem Handling": (159, 18, 9),
    },
    "NXP NPU": {
        # _GFPAlloc (VRC: 80%), 
        # import_page_map(VRC: 90%) 
        # (avg: VRC: 85%)
        "Relevant Functions": (1273, 15, 4), 

        # gckVIDMEM_NODE_WrapUserMemory (gcvHAL_WRAP_USER_MEMORY) (VRC: 70%), 
        # gckVIDMEM_NODE_LockCPU (gcvHAL_LOCK_VIDEO_MEMORY) (VRC: 60%) 
        # (avg: VRC: 65%)
        "KD Entry Point": (1273, 8, 5), 

        # gckVIDMEM_NODE_WrapUserMemory (struct gcsUSER_MEMORY_DESC) (VRC: 90%), 
        # gckVIDMEM_NODE_LockCPU  (struct gcsHAL_LOCK_VIDEO_MEMORY) (VRC: 60%)[1] 
        # (avg: VRC: 75%)
        "SMem Handling": (1273, 16, 7), 
    },
    "TMMA": {
        # dma_heap_map_dma_buf (VRC: 70%), 
        # dma_buf_phys_convert (VRC: 80%) 
        # (avg: VRC: 75%)
        "Relevant Functions": (6138, 7, 2), 

        # dma_heap_ioctl (DMA_HEAP_IOCTL_ALLOC) (VRC: 80%), 
        # dma_buf_phys_ioctl (DMA_BUF_PHYS_IOC_CONVERT) (VRC: 100%) 
        # (avg: VRC: 90%)
        "KD Entry Point": (6138, 9, 6), 

        # dma_buf_phys_ioctl (struct dma_buf_phys_data) (VRC: 100%), 
        # dma_heap_ioctl_allocate (struct dma_heap_allocation_data) (VRC: 100%) 
        # (avg: VRC: 100%)
        "SMem Handling": (6138, 16, 2), 
    },
    "HAILO": {
        # hailo_desc_list_create (VRC: 80%)
        # hailo_vdma_buffer_map (VRC: 90%)
        # (avg: VRC: 85%)
        "Relevant Functions": (296, 12, 2), 

        # hailo_desc_list_create_ioctl (HAILO_DESC_LIST_CREATE) (VRC: 100%), 
        # hailo_vdma_buffer_map_ioctl (HAILO_VDMA_BUFFER_MAP) (VRC: 90%) 
        # (avg: VRC: 95%)
        "KD Entry Point": (296, 20, 12), 

        # hailo_desc_list_create_ioctl (struct hailo_desc_list_create_params) (VRC: 100%), 
        # (avg: VRC: 100%)
        "SMem Handling": (296, 24, 4), 
    },
    "NVIDIA": {
        # nvmap_ioctl_create_from_va (VRC: 80%), 
        # nvgpu_vm_map_buffer (VRC: 80%) 
        # (avg: VRC: 80%)
        "Relevant Functions": (7624, 33, 13), 

        # nvmap_ioctl (NVMAP_IOC_FROM_VA, NVMAP_IOC_GET_FD) (VRC: 90%), 
        # gk20a_as_dev_ioctl (NVGPU_AS_IOCTL_MAP_BUFFER_EX) (VRC: 90%) 
        # (avg: VRC: 90%)
        "KD Entry Point": (7624, 39, 16), 

        # nvmap_ioctl_create_from_va (struct nvmap_create_handle_from_va) (VRC: 85%), 
        # nvmap_ioctl_getfd (struct nvmap_create_handle) (VRC: 100%) 
        # gk20a_as_ioctl_map_buffer_ex (struct nvgpu_as_map_buffer_ex_args) (VRC: 90%) 
        # (avg: VRC: 91.6%)
        "SMem Handling": (7624, 47, 24), 
    },
    "AWS": {
        # mc_alloc_internal (VRC: 70%)
        # ncdev_mem_buf_copy (VRC: 70%)
        # ncdev_mem_get_pa_deprecated (VRC: 80%)
        # (avg: VRC: 73.3%)
        "Relevant Functions": (635, 7, 4), 

        # ncdev_ioctl (NEURON_IOCTL_MEM_GET_PA, NEURON_IOCTL_MEM_ALLOC) (VRC: 90%)
        # (avg: VRC: 90%)
        "KD Entry Point": (635, 13, 9), 

        # ncdev_mem_get_pa_deprecated (struct neuron_ioctl_mem_get_pa) (VRC: 85%), 
        # ncdev_mem_buf_copy (struct neuron_ioctl_mem_buf_copy) (VRC: 80%), 
        # mc_alloc_internal (struct mem_chunk) (VRC: 80%)
        # (avg: VRC: 81.6%)
        "SMem Handling": (635, 17, 15), 
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
