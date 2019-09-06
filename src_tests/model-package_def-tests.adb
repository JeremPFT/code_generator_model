--  with Ada.Text_IO;
with Model.Visitor.Printer;
with Ada.Characters.Latin_1;

with Assertions; use Assertions; --  Check_Xxx
with Model.Element;

package body Model.Package_Def.Tests is
   
   -----------------------------------------------------------------------------
   
   Package_Name : constant String := "my_package";
   
   -----------------------------------------------------------------------------
   
   --------------
   --  Set_Up  --
   --------------
   
   procedure Set_Up
     (T : in out Test)
   is
      Fixture : constant access Object_T :=
        Model.Package_Def.Create (Name => Package_Name);
   begin
      T.Fixture := Element.Class_T (Fixture);
   end Set_Up;
   
   ---------------------------
   --  Test_Initialization  --
   ---------------------------
   
   overriding
   procedure Test_Initialization
     (T : in out Test)
   is
      pragma Unreferenced (T);
   begin
      null;
   end Test_Initialization;
   
   -------------------------
   --  Test_Is_Namespace  --
   -------------------------
   
   overriding
   procedure Test_Is_Namespace
     (T : in out Test)
   is
      Fixture : constant Class_T := Class_T (T.Fixture);
   begin
      Check_Boolean
        (Got      => Fixture.Is_Namespace,
         Expected => True);
   end Test_Is_Namespace;
   
   ---------------------------
   --  Test_Is_Packageable  --
   ---------------------------
   
   overriding
   procedure Test_Is_Packageable
     (T : in out Test)
   is
      Fixture : constant Class_T := Class_T (T.Fixture);
   begin
      Check_Boolean
        (Got      => Fixture.Is_Packageable,
         Expected => True);
   end Test_Is_Packageable;
   
   -----------------------
   --  Test_Add_Member  --
   -----------------------
   
   not overriding
   procedure Test_Add_Member
     (T : in out Test)
   is
      Fixture : constant Class_T := Class_T (T.Fixture);
      
      Member : constant access Object_T :=
        Create
          (Name       => Package_Name,
           Visibility => Visibility_Public);
      
   begin
      Fixture.Add_Member (Child => Member);
   end Test_Add_Member;
   
   ----------------------------
   --  Test_Visitor_Printer  --
   ----------------------------
   
   not overriding
   procedure Test_Visitor_Printer
     (T : in out Test)
   is
      Visitor : Model.Visitor.Printer.Object_T;
      
      EOL : constant String :=
        Ada.Characters.Latin_1.CR & Ada.Characters.Latin_1.LF;
      
      pragma Unreferenced (EOL);
   begin
      T.Fixture.Visit (Visitor);
      
      Assertions.Check_String (Got      => Visitor.To_String,
                               Expected => "package "
                                 & Package_Name);
   end Test_Visitor_Printer;
   
end Model.Package_Def.Tests;
