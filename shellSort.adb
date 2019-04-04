-- Sooraj Modi
-- 0965941
-- modis@uoguelph.ca
-- CIS 3190 Assignment 4

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure shellSort is
    type arr is array(1..100000) of integer;
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
        index : integer := 1;
    begin
        -- Open file
        create(fp,out_file,"sortedAda.txt");
        
        -- Write to file
        loop
            exit when index > arrLen;
            put_line(fp, integer'image(arrSorted(index)));
            index := index + 1;
        end loop;
        
        -- Close file
        if is_open(fp) then
            close(fp);
        end if;
    
        put_line("Sorted array sucessfully outputted to sortedAda.txt!");
        
        return 0;
    end writeSorted;
    
begin
    put_line("Beginning shell sort algorithm in ada");
    
    arrMain := readUnsorted;
    
    if writeSorted(arrMain.arrList, arrMain.arrLen) = 0 then 
        put_line("Now exiting program!");
    end if;
end shellSort;
