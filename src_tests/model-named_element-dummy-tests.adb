with Assertions; use Assertions; --  Check_Xxx

with Model.Element;

package body Model.Named_Element_Dummy.Tests is

   ----------------------------------------------------------------------------
   --  fixture constants
   ----------------------------------------------------------------------------

   Name: constant String := "dummy";

   ----------------------------------------------------------------------------
   --  subprograms
   ----------------------------------------------------------------------------

   --------------
   --  Set_Up  --
   --------------

   procedure Set_Up
     (T : in out Test)
   is

      Fixture : constant access Object_T :=
        Create (Name => Name);

   begin
      T.Fixture := Model.Element.Class_T (Fixture);
   end Set_Up;

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


end Model.Named_Element_Dummy.Tests;
