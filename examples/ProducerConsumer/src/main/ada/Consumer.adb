with Ada.Text_IO; use Ada.Text_IO;

task body Consumer is
  My_Value : Integer;
begin
  loop
    Buffer.Get (My_Value);
    Put_Line (Integer'Image(My_Value));
  end loop;
end Consumer;
