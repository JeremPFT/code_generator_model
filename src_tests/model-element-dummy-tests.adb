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
      Test.Fixture := Model.Element.Tests.Element_Class_Access_T (Fixture);
   end Set_Up;

end Model.Element.Dummy.Tests;
