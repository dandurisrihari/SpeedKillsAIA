echo "################################## starting attack ##################################"
id
ls -la ./label_image

# Using NPU
export USE_GPU_INFERENCE=0
echo $USE_GPU_INFERENCE
gdb -nx --args ./label_image -m mobilenet_v1_1.0_224_quant.tflite -i grace_hopper.bmp -l labels.txt --external_delegate_path=/usr/lib/libvx_delegate.so 2>&1 | tee ~/gdb_dump.log
