
NVCC := nvcc
CXX := /usr/bin/g++

CUDA_HOME := /usr/local/cuda
LIB := -L$(CUDA_HOME)/lib64

all: kernel.o kernel_dlink.o
	$(CXX) -o main main.cpp ppm_image.cpp kernel.o kernel_dlink.o -lcuda -lcudart

kernel_dlink.o: kernel.o
	$(NVCC) --gpu-architecture=sm_50 --device-link kernel.o --output-file kernel_dlink.o -lcuda -lcudart

kernel.o:
	$(NVCC) --gpu-architecture=sm_50 --device-c kernel.cu

clean:
	rm -f *.o main

