#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//void generateRandomArray(int** numArr);
void readArrayFromFile(int** numArr, int* arrLen, FILE* fp);
void shellSort(int** numArr, int* arrLen);
void outputResults(int** numArr, int* arrLen, char* fileName);

int main(void){
  printf("Beginning the Shell Sort Algorithm in C\n");

  int* numArr = NULL;

  /*printf("Generating an array of random numbers\n");
  generateRandomArray(&numArr);
  printf("Successfully generated an array of random numbers\n");*/

  char fileName[50];
  int* arrLen = NULL;
  arrLen = malloc(sizeof(int));
  FILE* fp = NULL;

  printf("Enter the name of the file of integers to be sorted: ");
  fgets(fileName, 50, stdin);
  fileName[strlen(fileName) - 1] = '\0';
  fp = fopen(fileName, "r");
  if(!fp){
    printf("Unable to find file\nNow terminating program\n");
    return 0;
  }

  readArrayFromFile(&numArr, arrLen, fp);
  //printf("arrLen: %d", *arrLen);

  time_t start, stop;
  start=clock();
  printf("Starting Timer\nBeginning shell sort\n");
  shellSort(&numArr, arrLen);
  printf("Successfully sorted array\nStopping Timer\n");
  stop=clock();
  printf("Total Time for ShellSort subroutine is: %ld seconds\n", (long int)(stop - start));

  printf("Outputting results to sorted.txt\n");
  outputResults(&numArr, arrLen, "sorted.txt");

  if(!numArr) free(numArr);
  if(!arrLen) free(arrLen);
  fclose(fp);

  printf("Successfully exiting program\n");
  return 0;
}

void shellSort(int** numArr, int* arrLen){
  for(int gap = *arrLen/2; gap > 0; gap /= 2){
    for(int i = gap; i < *arrLen; i++){
      int temp = (*numArr)[i];
      int j = 0;

      for(j = i; j >= gap && (*numArr)[j - gap] > temp; j--){
        (*numArr)[j] = (*numArr)[j-gap];
      }

      (*numArr)[j] = temp;
    }
  }
}

void readArrayFromFile(int** numArr, int* arrLen, FILE* fp){
  if(!fp)  return;

  fseek(fp, 0, SEEK_END);
  long int eof = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  *numArr = malloc(sizeof(int)*10000);

  char input[30];
  int index = 0;

  while(ftell(fp) != eof){
    fgets(input, 30, fp);
    (*numArr)[index] = atoi(input);
    index++;
  }

  *arrLen = index;
}

void outputResults(int** numArr, int* arrLen, char* fileName){
	FILE* fp = NULL;
	fp = fopen(fileName, "w");
	if(!fp){
		printf("Unable to create a new file for writing\nWriting to file failed\n");
		return;
	}

	for(int i = 0; i < *arrLen; i++)  fprintf(fp, "%d\n", (*numArr)[i]);

	fclose(fp);
}

/*void generateRandomArray(int** numArr){
  *numArr = malloc(sizeof(int)*1000);
  srand(time(NULL));

  for(int i = 0; i < 1000; i++){
    (*numArr)[i] = rand() % (1000 + 1);
  }
}*/
