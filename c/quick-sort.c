#include "stdio.h"
void quick_sort(int[], int left, int right);
int main() {
	int array[] = {2,4,5,6,7,1,9,7,6,5};
	quick_sort(array, 0, 10);
	return 0;
}

void quick_sort(int *array, int left, int right) {
	int i = left;
	int j = right;
	int slot = array[left];
	while(i < j) {
		while(i < j && array[j] >= slot) j--;
		if(i < j) array[i++] = array[j];
		while(i < j && array[i] < slot) i++;
		if(i < j) array[j--] = array[i];
	}
	array[i] = slot;
	quick_sort(array, left, i - 1);
	quick_sort(array, i + 1, right);
	int k = 0;
	for(; k < 10; k++) {
		printf("%d", array[k]);
	}
}
