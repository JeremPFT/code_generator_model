with Ada.Strings.Fixed;

with Assertions; use Assertions; --  Check_Xxx

package body Model.Comment.Tests is

   function "*"
     (Left  : Natural;
      Right : Character) return String renames Ada.Strings.Fixed."*";

   ----------------------------------------------------------------------------
   --  fixture constants
   ----------------------------------------------------------------------------

   EOL : String renames EOL_Dos;

   Comment_Line_1 : constant String := "some comment 1";
   Comment_Line_2 : constant String := "some comment 2";

   Comment_Text : constant String :=
     Comment_Line_1
     & EOL
     & Comment_Line_2;

   Header : constant String := 20 * '-' & EOL;
   Footer : constant String := EOL & Header;

   Prefix : constant String := "--  ";
   Suffix : constant String := "  --";

   ----------------------------------------------------------------------------
   --  subprograms
   ----------------------------------------------------------------------------

   --------------
   --  Set_Up  --
   --------------

   overriding
   procedure Set_Up
     (Test : in out Test_Fixture)
   is

      Fixture : constant access Object_T :=
        Create (Text   => Comment_Text,
                Header => Header,
                Footer => Footer,
                Prefix => Prefix,
                Suffix => Suffix);

   begin
      Test.Fixture := Fixture;
   end Set_Up;

   ---------------------------
   --  Test_Initialization  --
   ---------------------------

   procedure Test_Initialization
     (Test : in out Test_Fixture)
   is
      pragma Unreferenced (Test);
   begin
      null;
   end Test_Initialization;

   ---------------------------
   --  Test_Formatted_Text  --
   ---------------------------

   procedure Test_Formatted_Text
     (Test : in out Test_Fixture)
   is
      Expected : constant String :=
        Header
        & Prefix & Comment_Line_1 & Suffix & EOL
        & Prefix & Comment_Line_2 & Suffix
        & Footer;
   begin
      Check_String (Got      => Test.Fixture.Get_Formatted_Text,
                    Expected => Expected);
   end Test_Formatted_Text;

end Model.Comment.Tests;
