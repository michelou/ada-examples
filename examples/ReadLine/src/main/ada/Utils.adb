-- see http://www.adapower.com/index.php?Command=Class&ClassID=Basics&CID=202
with Ada.Text_IO;

package body Utils is

function Read_Line (File : in Ada.Text_IO.File_Type := Ada.Text_Io.Standard_Input) return String is
   Answer : String(1..256);
   Last   : Natural;
begin
   Ada.Text_IO.Get_Line(File => File,
      Item => Answer,
      Last => Last);
   if Last = Answer'Last then
      return Answer & Read_Line(File);
   else
      return Answer(1..Last);
   end if;
end Read_Line;

end Utils;
