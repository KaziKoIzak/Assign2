-- This declares the libraries used in the program, for example being able to print
with Ada.Text_IO; use Ada.Text_IO;

-- This is the main procedure of the program
procedure Assign2 is
   -- This is a custom data type that allows us to not type as muhc
   type Float_Array is array (Positive range <>) of Float;
   -- Declarations (if any)
   List : array(1 .. 14) of Integer := (3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121);
   -- Procedure declarations
   procedure Multiple;
   procedure Sum;
   procedure CheckPrime(Number: Integer);
   procedure Prime;
   procedure Palindrome;
   procedure PrintArray(Arr: Float_Array);
   procedure Swap(Left, Right: in out Float);
   procedure ArraySorter(Arr: in out Float_Array);
   procedure ArrayMaker(Arr1, Arr2, Arr3: in Float_Array; Size1, Size2: Integer; ArrResult: out Float_Array; Size3: out Integer);
   procedure RemoveDuplicates(Arr: in out Float_Array; Size: in out Integer);
   procedure PartA;
   procedure PartB;

   -- Main procedure
   procedure Main is
   begin
      -- Run part a then b
      PartA;

      Put_Line("-------------------------------------------------------------------");

      PartB;
      -- Call other procedures for part B if needed
   end Main;

   -- This program runs a function called multiple which check if the global array is multiple of 7, 11, 13
   procedure Multiple is
   begin
   -- Loop to go through the array
      for I in List'Range loop
         -- If statement to check if the number is a multiple of either 7, 11, or 13
         if List(I) mod 1001 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 7, 11, 13");
         elsif List(I) mod 77 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 7, 11");
         elsif List(I) mod 91 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 7, 13");
         elsif List(I) mod 143 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 11, 13");
         elsif List(I) mod 11 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 11");
         elsif List(I) mod 7 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 7");
         elsif List(I) mod 13 = 0 then
            Put_Line("The number " & Integer'Image(List(I)) & " is a multiple of 13");
         else
            Put_Line("The number " & Integer'Image(List(I)) & " is not a multiple of 7, 11, 13");
         end if;
      end loop;
   end Multiple;

   -- This procedure adds the sum of each digit in a number and checks if it is odd or even
   procedure Sum is
      -- Declare varaible
      Number : Integer;
   begin
      -- Go through the array, and reinitialize it constantly
      for I in List'Range loop
         declare
            Sum : Integer := 0;
            Digit : Integer;
            Even : Boolean;
         begin
            -- Starting number
            Number := List(I);

            -- Iterate through each digit of the number
            while Number /= 0 loop
               -- Extract the last digit
               Digit := Number mod 10;

               -- Add the digit to the sum
               Sum := Sum + Digit;

               -- Remove the last digit from the number
               Number := Number / 10;
            end loop;

            -- Even or Odd
            Even := Sum mod 2 = 0;

            -- Tell the user
            Put_Line("The sum of the digits for " & Integer'Image(List(I)) & " is " &
            Integer'Image(Sum) & " which is " & (if Even then "Even" else "Odd"));
         end;
      end loop;
   end Sum;

   -- The procedure checks if a number is prime, when given an integer
   procedure CheckPrime(Number: Integer) is
      -- Variable decleration
      Answer: Boolean := True;
   begin
      -- Check if it 2 or less
      if Number < 2 then
         Answer := False;  -- Numbers less than 2 are not prime
      else
         -- Check for divisibility by numbers from 2 to half of the number
         for J in 2 .. Number / 2 loop
            if Number mod J = 0 then
               -- If the number is divisible, it's not prime
               Answer := False;
               exit;  -- Exit the loop early if the number is not prime
            end if;
         end loop;
      end if;

      -- Tell the user the results
      Put_Line("The Number " & Integer'Image(Number) & (if Answer then " is Prime" else " isn't Prime"));
   end CheckPrime;

   -- Run a loop to check if it is prime
   procedure Prime is
   begin
      for Num in List'Range loop
         CheckPrime(List(Num));
      end loop;
   end Prime;

   -- The procedure that checks if the integer is a palindrome or not
   procedure Palindrome is
      -- Declare Number
      Number : Integer;
   begin
      -- Go through the list
      for I in List'Range loop
         declare
            Reversed : Integer := 0;
            Original : Integer;
            Digit : Integer;
            Answer : Boolean := False;
         begin
            -- The original number and the number that is going to be messed with are declared
            Original := List(I);
            Number := List(I);

            -- Iterate through each digit of the number
            while Number /= 0 loop
               -- Extract the last digit
               Digit := Number mod 10;

               -- Append the digit to the reversed number (shift left and add the digit)
               Reversed := Reversed * 10 + Digit;

               -- Remove the last digit from the number
               Number := Number / 10;
            end loop;

            -- Check if it is true
            if Original = Reversed then
               Answer := True;
            end if;

            -- Tell the user if the number is a palindrome
            Put_Line("The Number " & Integer'Image(Reversed) &
                     " is" & (if Answer then " a Palindrome of itself" else " not a Palindrome of itself"));
         end;
      end loop;
   end Palindrome;

   -- The procedure Part A is Part A of assignment and tells the user the results, this is where it gets called
   procedure PartA is
   begin
      -- Print where we are at and then also print which function we are at
      Put_Line("-------------------------------------------------------------------");
      Put_Line("Part A of Assignment");
      Put_Line("Multiple check of 7, 11, and 13");
      Multiple;
      Put_Line("-------------------------------------------------------------------");
      Put_Line("\nSum Check if Odd or Even Digits");
      Sum;
      Put_Line("-------------------------------------------------------------------");
      Put_Line("\nCheck if the number is a prime");
      Prime;
      Put_Line("-------------------------------------------------------------------");
      Put_Line("\nCheck if the number is a palindrome");
      Palindrome;
   end PartA;

   -- This prints the array given a parameter of a float_array
   procedure PrintArray(Arr: Float_Array) is
   begin
      -- Go through every element of the array and print them
      for I in Arr'Range loop
         Put(Arr(I)'Image);
         Put(" ");
      end loop;
      New_Line;
   end PrintArray;

   -- This procedure swaps the left and right numbers, this is used in bubble sort Right being j+1, and Left being J
   procedure Swap(Left, Right: in out Float) is
      -- Store Temp
      Temp : Float := Left;
   begin
      -- Swap
      Left := Right;
      Right := Temp;
   end Swap;

   -- Procdure that needs a Float Array and sorts them using the bubble sort algorithm
   procedure ArraySorter(Arr: in out Float_Array) is
   begin
      -- Bubble sort algorithm
      for I in Arr'First .. Arr'Last loop
         for J in Arr'First .. Arr'Last - I loop
            -- Swap if the element found is greater than the next element
            if Arr(J) > Arr(J + 1) then
               Swap(Arr(J), Arr(J + 1));
            end if;
         end loop;
      end loop;
   end ArraySorter;

   -- This procedure has plenty of arrays and integers, that is needed to make the larger array that both the first two arrays go into
   procedure ArrayMaker(Arr1, Arr2, Arr3: in Float_Array; Size1, Size2: Integer; ArrResult: out Float_Array; Size3: out Integer) is
      -- Decleration of variables
      I : Integer := 1;
   begin
      -- Put array 1 into larger array
      for J in Arr1'Range loop
         ArrResult(I) := Arr1(J);
         I := I + 1;
      end loop;

      -- Put array 2 into larger array
      for J in Arr2'Range loop
         ArrResult(I) := Arr2(J);
         I := I + 1;
      end loop;

      Size3 := I - 1;
   end ArrayMaker;

   -- Removes any duplicates in the larger array given the array and its size
   procedure RemoveDuplicates(Arr: in out Float_Array; Size: in out Integer) is
      -- Declare a new temp array
      Unique_Vector : Float_Array(1 .. Arr'Length);
   begin
      -- Use the erase-remove idiom to remove duplicates
      Unique_Vector := Arr;
      Unique_Vector := Unique_Vector(1 .. Size);

      -- Copy the unique elements back to the original array
      Size := Unique_Vector'Length;
      Arr := Unique_Vector;
   end RemoveDuplicates;

   -- This procedure takes care of Part B of the assignment
   procedure PartB is
      -- Declare float arrays
      System : Float_Array := (1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 12.4362, 24654.1234, 1234475.234, 0.00234923, 0.2341, 13.0, 14.0, 15.0);
      Programming : Float_Array := (1.0, 13462234.0, 8756.0, 3456345.0, 3452.0, 0.2345237543, 0.74567, 2345634.3456, 48753.3456, 4356.0, 345345.0, 695.0);
      Size : Integer := System'Length;
      Size2 : Integer := Programming'Length;
      Size3: Integer := System'Length + Programming'Length;
      New_Array : Float_Array(1 .. Size3);

      begin
      -- Print the arrays before they were sorted
      Put_Line("Arrays Before Sorted");
      PrintArray(System);
      PrintArray(Programming);

      -- Sort the array
      ArraySorter(System);
      ArraySorter(Programming);

      Put_Line("Arrays After Sorted");

      -- Print the arrays after the sort
      PrintArray(System);
      PrintArray(Programming);

      -- Make the merged array
      ArrayMaker(System, Programming, New_Array, Size, Size2, New_Array, Size3);
      RemoveDuplicates(New_Array, Size3);

      Put_Line("Merged Array");

      -- Print the merged array
      PrintArray(New_Array);
   end PartB;

-- Where the program actually begins
begin
   Main;
end Assign2;
