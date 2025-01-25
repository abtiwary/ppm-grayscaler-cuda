# CUDA PPM-Grayscaler

A CUDA/C++ application to convert a ppm image to grayscale.

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

```
❯ nvidia-smi
Sat Jan 25 01:00:17 2025       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 550.120                Driver Version: 550.120        CUDA Version: 12.4     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce GTX 1650        Off |   00000000:01:00.0  On |                  N/A |
|  0%   51C    P8             N/A /   75W |     613MiB /   4096MiB |     11%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
                                                                                         
+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A      1709      G   /usr/lib/xorg/Xorg                            336MiB |
|    0   N/A  N/A      2181      G   /usr/bin/kwalletd5                              1MiB |
|    0   N/A  N/A      2353      G   /usr/bin/ksmserver                              1MiB |
|    0   N/A  N/A      2355      G   /usr/bin/kded5                                  1MiB |
|    0   N/A  N/A      2356      G   /usr/bin/kwin_x11                              92MiB |
|    0   N/A  N/A      2424      G   /usr/bin/plasmashell                          120MiB |
|    0   N/A  N/A      2466      G   ...c/polkit-kde-authentication-agent-1          1MiB |
|    0   N/A  N/A      2468      G   ...-gnu/libexec/xdg-desktop-portal-kde          1MiB |
|    0   N/A  N/A      2580      G   ...86_64-linux-gnu/libexec/kdeconnectd          1MiB |
|    0   N/A  N/A      2581      G   /usr/bin/latte-dock                            15MiB |
|    0   N/A  N/A      2608      G   /usr/bin/kaccess                                1MiB |
|    0   N/A  N/A      2653      G   ...-linux-gnu/libexec/DiscoverNotifier          1MiB |
|    0   N/A  N/A      2830    C+G   /usr/bin/warp-terminal                         15MiB |
|    0   N/A  N/A      4582      G   /usr/bin/dolphin                                1MiB |
|    0   N/A  N/A      4622      G   ..._64-linux-gnu/libexec/kf5/kioslave5          1MiB |
|    0   N/A  N/A      4632      G   /usr/bin/dolphin                                1MiB |
|    0   N/A  N/A      4656      G   ..._64-linux-gnu/libexec/kf5/kioslave5          1MiB |
+-----------------------------------------------------------------------------------------+

❯ /usr/local/cuda/bin/nvcc --version                                                                                                                       
nvcc: NVIDIA (R) Cuda compiler driver                                                                                                                      
Copyright (c) 2005-2025 NVIDIA Corporation                                                                                                                 
Built on Wed_Jan_15_19:20:09_PST_2025                                                                                                                      
Cuda compilation tools, release 12.8, V12.8.61                                                                                                             
Build cuda_12.8.r12.8/compiler.35404655_0
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


