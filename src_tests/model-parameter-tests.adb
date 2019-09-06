with Ada.Characters.Latin_1;

with Assertions; use Assertions; --  Check_Xxx

with Model.Visitor.Printer;
with Model.Element;

package body Model.Parameter.Tests is
   
   -----------------------------------------------------------------------------
   
   Parameter_Name : constant String := "my_parameter";
   Parameter_Type : constant String := "parameter_type_integer";
   
   -----------------------------------------------------------------------------
   
   --------------
   --  Set_Up  --
   --------------
   
   procedure Set_Up (T : in out Test) is
   begin
      T.Fixture := Create (Name            => Parameter_Name,
                           Direction       => Direction_In,
                           Type_Expression => Parameter_Type);
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
         Expected => False);
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
         Expected => False);
   end Test_Is_Packageable;
   
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
                               Expected => "parameter "
                                 & Parameter_Name
                                 & " : "
                                 & Parameter.Direction_Img (Direction_In).all
                                 & " "
                                 & Parameter_Type);
   end Test_Visitor_Printer;
   
end Model.Parameter.Tests;
