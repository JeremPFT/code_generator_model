with Model.Element.Tests;

package Model.Element.Dummy.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Element.Tests;

   type Test_Fixture is new Parent_Pkg.Test_Fixture
     with null record;

   --------------
   --  Set_Up  --
   --------------

   overriding
   procedure Set_Up
     (Test : in out Test_Fixture);

   -----------------------------------------------------------------------------
   --  test routines
   -----------------------------------------------------------------------------

end Model.Element.Dummy.Tests;
