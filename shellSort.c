#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void generateRandomArray(int** numArr);
void shellSort(int** numArr, int num);

int main(void){
  printf("Beginning the Shell Sort Algorithm in C\n");

  printf("Generating an array of random numbers\n");
  int* numArr = NULL;
  generateRandomArray(&numArr);
  printf("Successfully generated an array of random numbers\n");

  printf("Beginning shell sort\n");
  shellSort(&numArr, 1000);
  printf("Successfully sorted array\n");

  if(numArr != NULL) free(numArr);
  printf("Successfully exiting program\n");
  return 0;
}

void shellSort(int** numArr, int arrLen){
  for(int gap = arrLen/2; gap > 0; gap /= 2){
    for(int i = gap; i < arrLen; i++){
      int temp = (*numArr)[i];
      int j = 0;

      for(j = i; j >= gap && (*numArr)[j - gap] > temp; j--){
        (*numArr)[j] = (*numArr)[j-gap];
      }

      (*numArr)[j] = temp;
    }
  }
}

void generateRandomArray(int** numArr){
  *numArr = malloc(sizeof(int)*1001);
  srand(time(NULL));

  for(int i = 0; i < 1000; i++){
    (*numArr)[i] = rand() % (1000 + 1);
  }
}
