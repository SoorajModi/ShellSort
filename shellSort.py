# Sooraj Modi
# 0965941
# modis@uoguelph.ca
# CIS 3190 - Assignment 4

import time
import random

def readListFromFile(numList):
	fileName = raw_input("Enter the name of the file to be read: ");
	fp = open(fileName, "r");
	for line in fp:
		numList.append(line);	
	fp.close()
	print("File successfully read!");
	
def writeListToFile(numList):
    print("Outputting sorted array to sortedPy.txt");
    with open("sortedPy.txt", "w") as fp:
		for item in numList:
			fp.write("%s" % item)
    fp.close()
    print("Successfully printed array to file");
    
def shellSort(numList):
	print("Beginning shell sort algorithm")
	print("Beginning timer")
	begin = time.time()
	
	print("Stopping timer")
	end = time.time()
	print("Total algorithm run time: ", end-begin, "seconds")

print("Beginning shell sort algorithm in python")
numList = list();
readListFromFile(numList)
shellSort(numList)
writeListToFile(numList)
print("Successfully exiting program")
