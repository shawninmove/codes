#include "stdio.h"

int maxsum(int *arr, int n) {
	int max = arr[0];
	int sum = 0;
	int i = 0;
	for(; i < n; i++) {
		if(sum < 0) sum = arr[i];
		else sum += arr[i];
		if(sum > max) max = sum;
	}
	return max;
}

int main() {
	int arr[] = {-10,-2,-4,-5,-10,-11,-23};
	printf("%d", maxsum(arr, 7));
	return 0;
}
