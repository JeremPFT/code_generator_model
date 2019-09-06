with Model.Named_Element.Tests;

package Model.Package_Def.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element.Tests;

   type Test is new Parent_Pkg.Test with null record;

   --------------
   --  Set_Up  --
   --------------

   procedure Set_Up (T : in out Test);

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

   overriding
   procedure Test_Is_Namespace
     (T : in out Test);

   ---------------------------
   --  Test_Is_Packageable  --
   ---------------------------

   overriding
   procedure Test_Is_Packageable
     (T : in out Test);

   -----------------------
   --  Test_Add_Member  --
   -----------------------

   not overriding
   procedure Test_Add_Member
     (T : in out Test);

   ----------------------------
   --  Test_Visitor_Printer  --
   ----------------------------

   not overriding
   procedure Test_Visitor_Printer
     (T : in out Test);

end Model.Package_Def.Tests;
