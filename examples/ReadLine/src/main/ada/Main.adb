-- adapted from http://www.adapower.com/index.php?Command=Class&ClassID=Basics&CID=202
with Ada.Strings; use Ada.Strings; -- To_String
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded; -- To_Unbounded_String
with Ada.Text_IO; use Ada.Text_IO;
with Utils;

procedure Main is
    Input : Unbounded_String;
begin
   Put ("Enter description: ");
   Input := To_Unbounded_String (Utils.Read_Line (Standard_Input));
   Put_Line (To_String (Input));
end Main;
