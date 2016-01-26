#include "hip_runtime.h"
// statistical kernel
__global__ void extract(hipLaunchParm lp,	long d_Ne,
											fp *d_I){										// pointer to input image (DEVICE GLOBAL MEMORY)

	// indexes
	int bx = hipBlockIdx_x;													// get current horizontal block index
	int tx = hipThreadIdx_x;													// get current horizontal thread index
	int ei = (bx*NUMBER_THREADS)+tx;						// unique thread id, more threads than actual elements !!!

	// copy input to output & log uncompress
	if(ei<d_Ne){															// do only for the number of elements, omit extra threads

		d_I[ei] = exp(d_I[ei]/255);												// exponentiate input IMAGE and copy to output image

	}

}