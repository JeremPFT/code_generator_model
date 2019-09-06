with AUnit.Test_Fixtures;

package Model.Element.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames AUnit.Test_Fixtures;

   type Test_Fixture is abstract new Parent_Pkg.Test_Fixture
   with record
      Fixture : Element_Class_T := null;
   end record;

   -----------------------------------------------------------------------------
   --  test routines
   -----------------------------------------------------------------------------

   ---------------------------
   --  Test_Initialization  --
   ---------------------------

   not overriding
   procedure Test_Initialization
     (Test : in out Test_Fixture);

   ------------------------
   --  Test_Add_Comment  --
   ------------------------

   not overriding
   procedure Test_Add_Comment
     (Test : in out Test_Fixture);

   --------------------------------
   --  Test_Get_Comment_Nominal  --
   --------------------------------

   not overriding
   procedure Test_Get_Comment_Nominal
     (Test: in out Test_Fixture);

   -------------------------------------
   --  Test_Get_Comment_Out_Of_bound  --
   -------------------------------------

   not overriding
   procedure Test_Get_Comment_Out_Of_Bound
     (Test: in out Test_Fixture);

end Model.Element.Tests;
