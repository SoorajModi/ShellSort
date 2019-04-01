! Sooraj Modi
! CIS 3190 - Assignment 4
! modis@uoguelph.ca
! 0965941

program main
    implicit none
    real :: arrLen = 0
    integer :: ios
    integer, allocatable :: numArr(:)
    character (len = 30) :: fileName
    character (len = 30) :: tempStr
    logical :: fileExist
    
    write(*,*)'Beginning the Shell Sort Algorithm in Fortran'
    
    write(*,*)'Enter the name of the file of integers to be sorted:'
    read(*,'(A)')fileName
    
    inquire(file=fileName, exist=fileExist)
    if(.NOT. fileExist) stop 'File does not exist, aborting'
    
    open(unit=9,file=fileName) 
    
    do 
	    read(9, '(A)', iostat=ios)tempStr
        if (ios /= 0) exit
        arrLen = arrLen + 1
    end do
    
    allocate(numArr(arrLen))
    
    rewind(9)
    !write (9,*) 'This is an example output to file'
    close (9)
end program
