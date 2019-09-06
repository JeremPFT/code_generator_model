with Model.Element.Tests;

package Model.Named_Element.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Element.Tests;

   type Test is abstract new Parent_Pkg.Test
     with null record;

   -----------------------------------------------------------------------------
   --  test routines
   -----------------------------------------------------------------------------

   ---------------------------
   --  Test_Initialization  --
   ---------------------------

   overriding
   procedure Test_Initialization
     (T : in out Test);

   -------------------------
   --  Test_Is_Namespace  --
   -------------------------

   not overriding
   procedure Test_Is_Namespace
     (T : in out Test)
     is abstract;

   --  ---------------------------
   --  --  Test_Is_Packageable  --
   --  ---------------------------

   --  not overriding
   --  procedure Test_Is_Packageable
   --    (T : in out Test)
   --    is abstract;

end Model.Named_Element.Tests;
