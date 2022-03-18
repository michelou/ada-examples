with Ada.Text_IO; use Ada.Text_IO;
with Week.Child; use Week.Child;
with Week.Child_2; use Week.Child_2;

procedure Main is
begin
   Put_Line ("First day of the week is "
             & Get_First_Of_Week);
   Put_Line ("Last day of the week is "
             & Get_Last_Of_Week);
end Main;
