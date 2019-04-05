# Sooraj Modi
# 0965941
# modis@uoguelph.ca
# CIS 3190 - Assignment 4

import time
import random
from array import *

def readListFromFile(numList):
	fileName = raw_input("Enter the name of the file to be read: ");
	fp = open(fileName, "r");
	for line in fp:
		line = line.replace('\n','')
		numList.append(line);	
	fp.close()
	print("File successfully read!");
	
def writeArrayToFile(numArr):
    print("Outputting sorted array to sortedPy.txt");
    with open("sortedPy.txt", "w") as fp:
		for item in numArr:
			fp.write("%s\n" % item)
    fp.close()
    print("Successfully printed array to file");
    
def convertListToArray(numList, numArray):
    dataset_list = ';'.join(numList)
    for item in dataset_list.split(';'): # comma, or other
	    numArr.append(item)
    
def shellSort(numArr):
    print("Beginning shell sort algorithm")
    print("Beginning timer")
    begin = time.time()
    
    arrLen = len(numArr)
    print("arrLen: ", arrLen)
    gap = arrLen / 2
    while gap > 0:
        for i in range(gap, arrLen):
            temp = numArr[i]
            j = i
			
            while ((j >= gap) and (numArr[j-gap] > temp)):
                numArr[j] = numArr[j-gap]
                j = j - gap
			
            numArr[j] = temp
        gap /= 2
        
    print("Stopping timer")
    end = time.time()
    print("Total algorithm run time: ", end-begin, "seconds")    


print("Beginning shell sort algorithm in python")

numList = list();
readListFromFile(numList)

numArr = []    # create an int array of the list length
convertListToArray(numList, numArr)

shellSort(numArr)

writeArrayToFile(numArr)

print("Successfully exiting program")
