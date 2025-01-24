# CUDA PPM-Grayscaler

An CUDA/C++ application to convert a ppm image to grayscale.

# Platform

This application was written to work on my machine: an i9 NUC-9 with an NVIDIA GeForce 1650 discrete card.

```
Device number: 0
        Device name: NVIDIA GeForce GTX 1650
        Memory Clock Rate (KHz): 6001000
        Memory Bus Width (bits): 128
        Peak Memory Bandwidth (GB/s): 192.032000

Device major version: 7; Device minor version: 5
Max blocks per multiprocessor: 16
Max threads per multiprocessor: 1024
Max blocks per multiprocessor: 16
Max grid size: 2147483647
Max threads dims: 1024
```

# Makefile

Install the CUDA toolkit, for Ubuntu in my case: follow the relevant link.

```
> make clean
> make
> ./main 
```

# Relevant links 

* https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu-installation
* PPM reader based on: https://github.com/abtiwary/PpmViewer
* https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#nvcc-options-for-separate-compilation


