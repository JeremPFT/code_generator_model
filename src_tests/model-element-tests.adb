with AUnit.Assertions; use AUnit.Assertions;

with Model.Comment;
with Model.Types.Comment;

with Assertions.Error_Expected;

package body Model.Element.Tests is

   Comment_1 : Types.Comment.Comment_Class_T;
   Comment_2 : Types.Comment.Comment_Class_T;

   Comment_1_Text : constant String := "abc";
   Comment_2_Text : constant String := "cde";

   ---------------------------
   --  Test_Initialization  --
   ---------------------------

   not overriding
   procedure Test_Initialization
   (Test : in out Test_Fixture)
   is
      pragma Unreferenced (Test);
   begin
      null;
   end Test_Initialization;

   ------------------------
   --  Test_Add_Comment  --
   ------------------------

   not overriding
   procedure Test_Add_Comment
   (Test : in out Test_Fixture)
   is
   begin
      Comment_1 := Model.Comment.Create (Comment_1_Text);
      Comment_2 := Model.Comment.Create (Comment_2_Text);

      Test.Fixture.Add_Comment (Comment_1);
      Test.Fixture.Add_Comment (Comment_2);
   end Test_Add_Comment;

   --------------------------------
   --  Test_Get_Comment_Nominal  --
   --------------------------------

   not overriding
   procedure Test_Get_Comment_Nominal
   (Test: in out Test_Fixture)
   is
   begin
      Comment_1 := Model.Comment.Create (Comment_1_Text);
      Comment_2 := Model.Comment.Create (Comment_2_Text);

      Test.Fixture.Add_Comment (Comment_1);
      Test.Fixture.Add_Comment (Comment_2);

      Assert (Test.Fixture.Get_Comment (1) = Comment_1, "retrieving comment 1");
      Assert (Test.Fixture.Get_Comment (2) = Comment_2, "retrieving comment 2");
   end Test_Get_Comment_Nominal;

   -------------------------------------
   --  Test_Get_Comment_Out_Of_bound  --
   -------------------------------------

   not overriding
   procedure Test_Get_Comment_Out_Of_Bound
   (Test: in out Test_Fixture)
   is
      Error_Found: Boolean := False;
   begin
      declare
         pragma Warnings (Off, "assigned but never");
         Comment : Types.Comment.Comment_Class_T := null;
      begin
         Comment := Test.Fixture.Get_Comment (Index => 1);
         pragma Warnings (On, "assigned but never");
      exception
      when E : others =>
         Error_Found := True;

         Assertions.Error_Expected
         (Error      => E,
          File       => "model-element-tests.adb",
          Subprogram => "Test_Get_Comment_Out_Of_Bound");

      end;

      Assert (Error_Found, "no raised error");
   end Test_Get_Comment_Out_Of_Bound;

end Model.Element.Tests;
