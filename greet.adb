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
   procedure PartB;
   -- Add declarations for other procedures used in your code

   -- Main procedure
   procedure Main is
   begin
      -- Run part a then b
      PartA;

      Put_Line("-------------------------------------------------------------------");

      PartB;
      -- Call other procedures for part B if needed
   end Main;

   -- Procedure bodies
   procedure Multiple is
   begin
      -- Implementation of Multiple procedure
   end Multiple;

   procedure Sum is
   begin
      -- Implementation of Sum procedure
   end Sum;

   procedure Prime is
   begin
      -- Implementation of Prime procedure
   end Prime;

   procedure Palindrome is
   begin
      -- Implementation of Palindrome procedure
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
   -- Optional initialization code here
end YourProgram;