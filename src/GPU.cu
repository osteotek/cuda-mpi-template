#include <cuda.h>
#include <iostream>
#include <stdio.h>

__global__ void mult(int x, int y, int *res) {
  *res = x * y;
}

int gpu(int x, int y) {
  int *dev_res;
  int res = 0;
  cudaMalloc((void**)&dev_res, sizof(int));
  mult<<<1, 1>>>(x, y, dev_res);
  cudaMemcpy(&res, dev_res, sizeof(int), cudaMemcpyDeviceToHost);
  cudaFree(dev_res);

  return res;
}
