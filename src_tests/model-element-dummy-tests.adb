with Model.Types.Element; use Model.Types.Element;

package body Model.Element.Dummy.Tests is

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
      Fixture : constant access Object_T := Create;
   begin
      Test.Fixture := Element_Class_T (Fixture);
   end Set_Up;

end Model.Element.Dummy.Tests;
