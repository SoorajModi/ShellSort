-- Sooraj Modi
-- 0965941
-- modis@uoguelph.ca
-- CIS 3190 Assignment 4

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure shellSort is
    type arr is array(1..100001) of integer;
    type arr_stack is
        record
            arrList : arr;
            arrLen : integer := 1;
    end record;
    arrMain : arr_stack;
    
    function readUnsorted return arr_stack is
        arrUnsorted : arr_stack;
        fileName : string(1..25);
        fp : file_type;
        strLen : integer := 25;
        buffer : integer;
    begin
        -- Prompt user for file name to be read, max of 25 characters
        put_line("Enter the name of the file to be read (must be .txt): ");
        get_line(fileName, strLen);
        
        -- Open file
        open(fp,in_file,fileName);        
        
        -- Read every line of the file, place values into arrays
        loop
            exit when end_of_file(fp);
            get(fp,buffer);
            arrUnsorted.arrList(arrUnsorted.arrLen) := buffer;
            arrUnsorted.arrLen := arrUnsorted.arrLen + 1;         
        end loop;
        
        -- Close file
        if is_open(fp) then
            close(fp);
        end if;
        
        put_line("File successfully read!");
        
        return arrUnsorted;
    end readUnsorted;
    
    function writeSorted(arrSorted : arr; arrLen: integer) return integer is
        fp : file_type;
        index : integer := arrLen;
    begin
        -- Open file
        create(fp,out_file,"sortedAda.txt");
        
        -- Write to file
        loop
            exit when index = 1;
            put_line(fp, integer'image(arrSorted(index)));
            index := index - 1;
        end loop;
        
        -- Close file
        if is_open(fp) then
            close(fp);
        end if;
    
        put_line("Sorted array sucessfully outputted to sortedAda.txt!");
        
        return 0;
    end writeSorted;
    
    function shellSortArray(arr1 : arr; arrLen: integer) return arr is 
        gap : integer := arrLen / 2;
        temp : integer;
        i : integer;
        j : integer := 0;
        arr2 : arr := arr1;  
    begin
       loop
           exit when gap = 0;
           i := gap;
           loop 
               exit when i = arrLen;
               temp := arr2(i);
               j := i;
               
               while (j > gap) and then (j > 1) loop
                   exit when (arr2(j - gap) > temp);
                   arr2(j) := arr2(j-gap);                   
                   j := j - 1;
               end loop;
               
               arr2(j) := temp;
               
               i := i + 1;
           end loop;
           
           gap := gap / 2;
       end loop;
       
       return arr2;
    end shellSortArray;
    
begin
    put_line("Beginning shell sort algorithm in ada");
    
    -- Read in array from file
    arrMain := readUnsorted;
    
    -- Sort the array using the shell sort algorithm
    arrMain.arrList := shellSortArray(arrMain.arrList, arrMain.arrLen);
    
    -- Write the sorted array to a file
    if writeSorted(arrMain.arrList, arrMain.arrLen) = 0 then 
        put_line("Now exiting program!");
    end if;
end shellSort;
