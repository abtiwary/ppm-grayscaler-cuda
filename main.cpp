
#include <string>
#include <cstdint>
#include <stdlib.h>

#include "kernel.cuh"

#include "ppm_image.hpp"

int main(int argc, char* argv[]) {
    std::string input_image = "/home/pimeson/Development/CudaDev/grayscale_cuda/M31NMmosaicM.ppm";

    auto ppm = PPMImage::PPMImage(input_image);
    ppm.ReadImageFile();
    auto image_data = ppm.GetImageData();
    int width = ppm.GetImageWidth();
    int height = ppm.GetImageHeight();

    grayscaler(width, height, (uint8_t*)image_data.data());

    return 0;
}

