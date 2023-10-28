------------------------------------------------------------------------------
-- Purpose : <describe the purpose of this package>
-- Created : <who>/<date>
-- Modified: <who>/<date>
------------------------------------------------------------------------------
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
