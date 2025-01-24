
#include <cstdint>
#include <iostream>

#include "kernel.cuh"
#include "cuda_runtime.h"

__global__
void grayscale_gpu(uint8_t* in_image, uint8_t* out_image, int width, int height) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    int index = (y * width + x) * 3;

    if (x < width && y < height) {
        uint8_t r = in_image[index + 0];
        uint8_t g = in_image[index + 1];
        uint8_t b = in_image[index + 2];

        uint8_t val = (uint8_t)(0.30*(float)r + 0.59*(float)g + 0.11*(float)b);
         
        out_image[index + 0] = val;
        out_image[index + 1] = val;
        out_image[index + 2] = val;
    }
    
}

void grayscaler(int width, int height, uint8_t* image_data) {
    uint8_t* host_img = (uint8_t*)malloc(width * height * 3);
    if (!host_img) {
        fprintf(stderr, "could not malloc the host image!\n");
        return;
    }

    uint8_t* device_in_img;
    cudaMalloc(&device_in_img, width * height * 3);
    cudaMemcpy(device_in_img, image_data, width * height * 3, cudaMemcpyHostToDevice);

    uint8_t* device_out_img;
    cudaMalloc(&device_out_img, width * height * 3);

    dim3 blocks(32, 32);
    dim3 grids(ceil((float)width / 32), ceil((float)height / 32));
    
    grayscale_gpu<<<grids, blocks>>>(device_in_img, device_out_img, width, height);
    cudaDeviceSynchronize();
    
    cudaMemcpy(host_img, device_out_img, width * height * 3, cudaMemcpyDeviceToHost);
    cudaDeviceSynchronize();

    // write an output image
    FILE* outfile = fopen("/home/pimeson/temp/grayscale_cuda.ppm", "w+");
    fprintf(outfile, "P6\n%d %d 255\n", width, height);
    fwrite(host_img, width * height * 3, sizeof(uint8_t), outfile); 
    fclose(outfile);
    
    free(host_img);
    cudaFree(device_in_img);
    cudaFree(device_out_img);

    std::cout << "wrote an image\n";
}

