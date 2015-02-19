extern "C"
__global__ void add_strided_float(int n, float *dx, float *dy) {
       int  dxIdx = blockDim.x * blockIdx.x + threadIdx.x;
          int  incx = blockDim.x * gridDim.x;
          int incy = blockDim.y * gridDim.y;
          int dyIdx = blockDim.y * gridDim.y + threadIdx.y;

      for (int c = 0, xi = dxIdx, yi = dyIdx; c < n; c++, xi += incx, yi += incy) {
                         dy[yi] += dx[xi];
       }
 }


