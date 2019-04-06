# Sooraj Modi
# 0965941
# modis@uoguelph.ca
# CIS 3190 - Assignment 4
# To compile: python shellSort.py

import time
import random
from array import *

def readListFromFile(numList):
	fileName = raw_input("Enter the name of the file to be read: ");
	# Open and read numbers from file into array
	fp = open(fileName, "r");
	for line in fp:
		line = line.replace('\n','')
		numList.append(line);	
	fp.close()
	print("File successfully read!");
	
def writeArrayToFile(numArr):
    print("Outputting sorted array to sortedPy.txt");
    # Open and output to file
    with open("sortedPy.txt", "w") as fp:
		for item in numArr:
			fp.write("%s\n" % item)
    fp.close()
    print("Successfully printed array to file");
    
def convertListToArray(numList, numArray):
    newList = ';'.join(numList)
    for item in newList.split(';'):
	    numArr.append(item)
    
def shellSort(numArr):
    print("Beginning shell sort algorithm")
    print("Beginning timer")
    begin = time.time()
    
    # Begin shell sort algorithm
    arrLen = len(numArr)
    gap = arrLen / 2
    while gap > 0:
        for i in range(gap, arrLen):
            temp = numArr[i]
            j = i
			
            while ((j >= gap) and (numArr[j-gap] > temp)):
                numArr[j] = numArr[j-gap]
                j = j - gap
			
            numArr[j] = temp
        gap //= 2
    
    # Output run time    
    print("Stopping timer")
    end = time.time()
    print("Total algorithm run time: ", end-begin, "seconds")    

# Say Hello
print("Beginning shell sort program in python")

# Read from file
numList = list();
readListFromFile(numList)

# Convert list to array
numArr = []
convertListToArray(numList, numArr)

# Sort the array
shellSort(numArr)

# Write to file
writeArrayToFile(numArr)

# Say goodbye <- pls give me full comment marks
print("Successfully exiting program")
