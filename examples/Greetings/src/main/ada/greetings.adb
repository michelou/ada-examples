--
-- @summary
-- Package body Greetings implements two procedures to print "Hello" or "Goodbye".
--
-- Created : 13.02.2022/mics
--
-- Modified: 19.08.2024/mics
--
with Ada.Text_IO; use Ada.Text_IO;

package body Greetings is
   procedure Hello is
   begin
      Put_Line ("Hello WORLD!");
   end Hello;
   procedure Goodbye is
   begin
      Put_Line ("Goodbye WORLD!");
   end Goodbye;
end Greetings;
