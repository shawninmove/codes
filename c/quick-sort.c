#include "stdio.h"

int sort(int arr[], int low, int high) {
	int sentry = arr[low]; //create a slot at low
	while(low < high) {
		while(low < high && arr[high] > sentry) high--; //find a smaller to fill the slot, and create a new slot
		arr[low] = arr[high];
		while(low < high && arr[low] < sentry) low++; //find a bigger to fill the slot, and create a new slot
		arr[high] = arr[low];
	}
	arr[low] = sentry; //fill in the slot
	return low;
}
void quick_sort(int arr[], int low, int high) {
	int loc = 0;
	if(low < high) {
		loc = sort(arr, low, high);
		quick_sort(arr, low, loc - 1);
		quick_sort(arr, loc + 1, high);
	}
}

int main() {
	int arr[] = {2,-10,11,7,8,6,5,3,1,0,33,48};
	quick_sort(arr, 0, 11);
	int i = 0;
	for(; i < 12; i++) {
		printf("%d ", arr[i]);
	}
	return 0;
}
