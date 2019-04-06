! Sooraj Modi
! CIS 3190 - Assignment 4
! modis@uoguelph.ca
! 0965941
! To compile: "gfortran -Wall shellSort.f95 -o fortran"

program main
    implicit none
    integer :: arrLen = 0
    integer, dimension(100000) :: numArr
    
    ! Say hello, and get array to be sorted
    write(*,*)'Beginning the Shell Sort Program in Fortran'
    call readArrayFromFile(numArr,arrLen)
    
    ! Sorting happens here
    call shellSort(numArr, arrLen)    
    write(*,*)'Successfully sorted array'
    
    ! Output sorted array to file
    write(*,*)'Outputting results to sortedFortran.txt'
    call outputArrayToFile(numArr, arrLen)
    
    write(*,*)'Successfully exiting program'
end program

subroutine shellSort(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in) :: arrLen   
    integer :: gap, i, temp, j, c1, c2, cr, cm
    
    ! Begin timer
    call system_clock(count_rate=cr)
    call system_clock(count_max=cm)
    rate = real(cr)
    
    write(*,*)'Beginning timer'
    call system_clock(c1)
    
    ! Begin shell sort algorithm
    write(*,*)'Beginning shell sort algorithm on array'
    gap = arrLen/2
    do while (gap > 0) 
        do i = gap, arrLen
            temp = numArr(i)
            j = i
            
            do while ((j >= gap) .and. (numArr(j-gap) > temp))
                numArr(j) = numArr(j-gap)
                j = j - 1
            end do
                        
            numArr(j) = temp
        end do
        gap = gap / 2
    end do
    
    ! Output runtime to user
    write(*,*)'Stopping timer'
    call system_clock(c2)
    write(*,*)'Total algorithm time (seconds): ', (c2-c1)/rate    
end subroutine 

subroutine readArrayFromFile(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in out) :: arrLen
    character (len = 30) :: fileName
    logical :: fileExist
    integer :: ios, temp  
    
    ! Prompt user
    write(*,*)'Enter the name of the file of integers to be sorted:'
    read(*,*)fileName
    
    ! Check if file exist and open
    inquire(file=fileName, exist=fileExist)
    if(.NOT. fileExist) stop 'File does not exist, aborting'   
    open(unit=9,file=fileName) 
    
    ! Read every line in file and put in array
    do 
        read(9, *, iostat=ios)temp
        if (ios /= 0) exit
        numArr(arrLen) = temp
        arrLen = arrLen + 1
    end do
    
    arrLen = arrLen - 1
    
    ! Close file
    close (9)
end subroutine 

subroutine outputArrayToFile(numArr,arrLen)
    integer, dimension(100000), intent (in out) :: numArr
    integer, intent (in) :: arrLen  
    integer :: i
    
    ! Open file to be written in
    open(unit=15,file="sortedFortran.txt")
    
    ! Write every element of the array to file
    do i = 0, arrLen
        write(15,*)numArr(i)
    end do     
    
    ! Close file
    close(15)
end subroutine
