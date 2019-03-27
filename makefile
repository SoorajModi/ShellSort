CC = gcc
CFLAGS = -Wall -std=c99 -pedantic

program:
	$(CC) $(CFLAGS) shellSort.c -o shellSort

run:
	./shellSort

sayHi:
	@echo 'This is Assignment 4 for CIS 3190 by Sooraj Modi'
