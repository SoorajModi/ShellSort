! Sooraj Modi
! CIS 3190 - Assignment 4
! modis@uoguelph.ca
! 0965941

program main
    implicit none
    integer :: arrLen = 0
    integer :: ios
    integer :: temp
    character (len = 30) :: fileName
    integer, dimension(100000) :: numArr
    logical :: fileExist
    
    write(*,*)'Beginning the Shell Sort Algorithm in Fortran'
    
    write(*,*)'Enter the name of the file of integers to be sorted:'
    read(*,*)fileName
    
    inquire(file=fileName, exist=fileExist)
    if(.NOT. fileExist) stop 'File does not exist, aborting'
    
    open(unit=9,file=fileName) 
    
    do 
        read(9, *, iostat=ios)temp
        if (ios /= 0) exit
        numArr(arrLen) = temp
        arrLen = arrLen + 1
    end do
    
    arrLen = arrLen - 1
    
    write(*,*)numArr(arrLen)
    
    close (9)
end program
