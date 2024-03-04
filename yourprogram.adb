with Ada.Text_IO; use Ada.Text_IO;

procedure YourProgram is
   -- Declarations (if any)
   List : array(1 .. 14) of Integer := (3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121);
   -- Procedure declarations
   procedure Multiple;
   procedure Sum;
   procedure Prime;
   procedure Palindrome;
   procedure PartA;
   --procedure PartB;
   -- Add declarations for other procedures used in your code

   -- Main procedure
   procedure Main is
   begin
      -- Run part a then b
      PartA;

      Put_Line("-------------------------------------------------------------------");

      --PartB;
      -- Call other procedures for part B if needed
   end Main;

   -- Procedure bodies
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


   procedure Sum is
      Number : Integer;
   begin
      for I in List'Range loop
         declare
            Sum : Integer := 0;
            Digit : Integer;
            Even : Boolean;
         begin
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

            Even := Sum mod 2 = 0;

            -- Tell the user
            Put_Line("The sum of the digits for " & Integer'Image(List(I)) & " is " &
            Integer'Image(Sum) & " which is " & (if Even then "Even" else "Odd"));
         end;
      end loop;
   end Sum;


   procedure CheckPrime(Number: Integer) is
      Answer: Boolean := True;
   begin
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
      Put_Line("The Number " & Integer'Image(Number) & (if Answer then "is Prime" else "isn't Prime"));
   end CheckPrime;

   -- Example usage
   procedure Prime is
   begin
      for Num in List'Range loop
         CheckPrime(List(Num));
      end loop;
   end Prime;


   procedure Palindrome is
      Number : Integer;
   begin
      for I in List'Range loop
         declare
            Reversed : Integer := 0;
            Original : Integer;
            Digit : Integer;
            Answer : Boolean := False;
         begin
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

            if Original = Reversed then
               Answer := True;
            end if;

            -- Tell the user if the number is a palindrome
            Put_Line("The Number " & Integer'Image(Reversed) &
                     " is" & (if Answer then " a Palindrome of itself" else " not a Palindrome of itself"));
         end;
      end loop;
   end Palindrome;


   procedure PartA is
   begin
      -- Print where we are at and then also print which function we are at
      Put_Line("Part A of Assignment");
      Put_Line("Multiple check of 7, 11, and 13");
      Multiple;
      Put_Line("\nSum Check if Odd or Even Digits");
      Sum;
      Put_Line("\nCheck if the number is a prime");
      Prime;
      Put_Line("\nCheck if the number is a palindrome");
      Palindrome;
   end PartA;


      -- Add bodies for other procedures used in your code

   begin
   Main;
end YourProgram;