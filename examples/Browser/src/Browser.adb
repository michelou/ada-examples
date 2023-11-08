--
-- Purpose : <describe the purpose of this package>
-- Created : <who>/<dd.mm.yyyy>
-- Modified: <who>/<dd.mm.yyyy>
--
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Browser is
   Cmd : aliased char_array := To_C ("open");
   Html_Path : aliased char_array := To_C ("http://ada.tips/");
   Dir : aliased char_array := To_C ("\");
   H : Long;

   function Shell_Execute (Wnd : Int;
            Operation, File, Parameters, Directory : chars_ptr;
            ShowCmd : Interfaces.C.Int) return Long;
        Pragma Import (Stdcall, Shell_Execute, "ShellExecuteA");
begin
   -- ShellExecute(null, "open", htmlpath, NULL, "\", SW_SHOWNORMAL);

   H := Shell_Execute
     (0,
      To_Chars_Ptr (Cmd'Unchecked_Access),
      To_Chars_Ptr (Html_Path'Unchecked_Access),
      Null_Ptr,
      To_Chars_Ptr (Dir'Unchecked_Access), 1);
end Browser;
