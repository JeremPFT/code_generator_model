with AUnit.Test_Fixtures;

package Model.Comment.Tests is

   -----------------------------------------------------------------------------
   --  fixture
   -----------------------------------------------------------------------------

   package Parent_Pkg renames AUnit.Test_Fixtures;

   type Test_Fixture is new Parent_Pkg.Test_Fixture
   with record
      Fixture : access Object_T'Class := null;
   end record;

   --------------
   --  Set_Up  --
   --------------

   overriding
   procedure Set_Up
     (Test : in out Test_Fixture);

   -----------------------------------------------------------------------------
   --  test routines
   -----------------------------------------------------------------------------

   ---------------------------
   --  Test_Initialization  --
   ---------------------------

   not overriding
   procedure Test_Initialization
     (Test : in out Test_Fixture);

   ---------------------------
   --  Test_Formatted_Text  --
   ---------------------------

   not overriding
   procedure Test_Formatted_Text
     (Test : in out Test_Fixture);

end Model.Comment.Tests;
