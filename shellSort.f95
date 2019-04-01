! Sooraj Modi
! CIS 3190 - Assignment 4
! modis@uoguelph.ca
! 0965941

program main
    implicit none
    real :: arrLen;
    integer, allocatable :: numArr(:)
    character (len = 30) :: fileName
    logical :: fileExist
    
    write(*,*)'Beginning the Shell Sort Algorithm in Fortran'
    
    write(*,*)'Enter the name of the file of integers to be sorted:'
    read(*,'(A)')fileName
    
    inquire(file=fileName, exist=fileExist)
    if(.NOT. fileExist) stop 'File does not exist, aborting'
    
    open(unit=9,file=fileName)
    
    !if (fileExist) then
    !   open(unit=9,file=fileName)
    !else
    !   write (*,*) 'File does not exist, aborting'
    !   stop		!I prob should not do this
    !end if
    
    
    
    !write (9,*) 'This is an example output to file'
    close (9)
end program
