with Model.Named_Element.Tests;

package Model.Named_Element_Dummy.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element.Tests;

   type Test is new Parent_Pkg.Test
     with null record;

   --------------
   --  Set_Up  --
   --------------

   procedure Set_Up (T : in out Test);

   -----------------------------------------------------------------------------
   --  test routines
   -----------------------------------------------------------------------------

   -------------------------
   --  Test_Is_Namespace  --
   -------------------------

   overriding
   procedure Test_Is_Namespace
     (T : in out Test);

end Model.Named_Element_Dummy.Tests;
