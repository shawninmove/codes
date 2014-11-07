#include "stdio.h"

int main() {
	int array[] = {1,2,3,4,5,6,7,8,9};
	int goal;
	printf("which number you want to find?");
	scanf("%d",&goal);
	//printf("%d", goal);
	int low = 0;
	int high = 9;
	while(low <= high) {
		int middle = (high + low) / 2;
		if(array[middle] == goal) {
			printf("find goal:%d", array[middle]);
			return 0;
		}else if(array[middle] > goal) {
			high = middle - 1;
		}else {
			low = middle + 1;
		}
	}
	printf("can't find %d\n", goal);
	return 0;
}
