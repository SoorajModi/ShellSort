/* Sooraj Modi
 * CIS 3190 - Assignment 4
 * modis@uoguelph.ca
 * 0965941
 * To compile: "gcc --Wall -std=c99 shellSort.c -o output"
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//void generateRandomArray(int** numArr);
void readArrayFromFile(int** numArr, int* arrLen, FILE* fp);
void shellSort(int** numArr, int* arrLen);
void outputResults(int** numArr, int* arrLen, char* fileName);

int main(void){
  printf("Beginning the Shell Sort Program in C\n");

  int* numArr = NULL;

  char fileName[50];
  int* arrLen = NULL;
  arrLen = malloc(sizeof(int));
  FILE* fp = NULL;

  // Open file to be read
  printf("Enter the name of the file of integers to be sorted: ");
  fgets(fileName, 50, stdin);
  fileName[strlen(fileName) - 1] = '\0';
  fp = fopen(fileName, "r");
  if(!fp){
    printf("Unable to find file\nNow terminating program\n");
    return 0;
  }

  readArrayFromFile(&numArr, arrLen, fp);

  //Commence algorithm and timer
  time_t start, stop;
  start=clock();
  printf("Starting Timer\nBeginning shell sort\n");
  shellSort(&numArr, arrLen);
  printf("Successfully sorted array\nStopping Timer\n");
  stop=clock();
  printf("Total Time for ShellSort subroutine is: %ld micro seconds\n", (long int)(stop - start));

  //Output results
  printf("Outputting results to sorted.txt\n");
  outputResults(&numArr, arrLen, "sortedC.txt");

  //Free allocated memory
  if(!numArr) free(numArr);
  if(!arrLen) free(arrLen);
  fclose(fp);

  printf("Successfully exiting program\n");
  return 0;
}

void shellSort(int** numArr, int* arrLen){
  // Beginning shell sort algorithm
  for(int gap = *arrLen/2; gap > 0; gap /= 2){
    for(int i = gap; i < *arrLen; i++){
      int temp = (*numArr)[i];
      int j = i;

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

  *numArr = malloc(sizeof(int)*100500);

  char input[30];
  int index = 0;

  // Read every element in file and place into array
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
	//Check to make sure file was made (error proofing)
	if(!fp){
		printf("Unable to create a new file for writing\nWriting to file failed\n");
		return;
	}

    // Output every element of the array into a file
	for(int i = 0; i < *arrLen; i++)  fprintf(fp, "%d\n", (*numArr)[i]);

	fclose(fp);
}
