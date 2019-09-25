with Ada.Characters.Latin_1;
with Ada.Text_IO;

package Model is

   type String_Access_T is access all String;

   package Dbg renames Ada.Text_IO;
   package T_IO renames Ada.Text_IO;

   package Latin_1 renames Ada.Characters.Latin_1;

   EOL_Dos  : constant String := Latin_1.CR & Latin_1.LF;
   EOL_Unix : constant String := Latin_1.LF'Image;
   EOL      : String renames EOL_Dos;

   Out_Of_Bound : exception;
   --  raised by Get_Comment when Index > Comment_Count
   --  raised by Get_Owned_Element when Index > Owned_Element_Count
   ----------------------------------------------------------------------------

end Model;
