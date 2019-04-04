! Sooraj Modi
! CIS 3190 - Assignment 4
! modis@uoguelph.ca
! 0965941

program main
    implicit none
    integer :: arrLen = 0
    integer, dimension(100000) :: numArr
    
    write(*,*)'Beginning the Shell Sort Algorithm in Fortran'
    call readArrayFromFile(numArr,arrLen)
    
    write(*,*)'Beginning shell sort algorithm'
    call shellSort(numArr, arrLen)    
    write(*,*)'Successfully sorted array'
    
    write(*,*)'Outputting results to sorted.txt'
    call outputArrayToFile(numArr, arrLen)
    
    write(*,*)'Successfully exiting program'
end program

subroutine shellSort(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in) :: arrLen   
    integer :: gap, i, temp, j
    
    gap = 0
    do gap = arrLen/2, 0, gap/2
        do i = gap, arrLen
            temp = numArr(i)
            j = 0
            
            do j = i, gap, -1
                if(numArr(j-gap) < temp) then
                    numArr(j) = numArr(j-gap)
                end if
            end do
                        
            numArr(j) = temp
        end do
    end do    
end subroutine 

subroutine readArrayFromFile(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in out) :: arrLen
    character (len = 30) :: fileName
    logical :: fileExist
    integer :: ios, temp  
    
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
    
    close (9)
end subroutine 

subroutine outputArrayToFile(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in) :: arrLen  
    integer :: i
    
    open(unit=15,file="sorted.txt")
    
    do i = 0, arrLen
        write(15,*)numArr(i)
    end do     
    
    close(15)
end subroutine
