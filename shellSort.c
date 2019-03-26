#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void generateRandomArray(int** randNumArr);

int main(void){
  printf("Beginning the Shell Sort Algorithm in C\n");

  printf("Generating an array of random numbers\n");
  int* randNumArr = NULL;
  generateRandomArray(&randNumArr);


  if(randNumArr != NULL) free(randNumArr);
  printf("Successfully exiting program\n");
  return 0;
}

void generateRandomArray(int** randNumArr){
  *randNumArr = malloc(sizeof(int)*1001);
  srand(time(NULL));

  for(int i = 0; i < 1000; i++){
    (*randNumArr)[i] = rand() % (1000 + 1);
  }
}
