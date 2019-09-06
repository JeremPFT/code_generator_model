with AUnit.Test_Caller;
with AUnit.Test_Suites;

with Suite_Utils;

with Model.Comment.Tests;
use Model.Comment.Tests; --  test fixtures & routines

package Model.Comment.Suites is

   Test_Unit_Name : constant String := "Comment";

   package Runner is new AUnit.Test_Caller
     (Test_Fixture => Model.Comment.Tests.Test_Fixture);

   package Utils is new Suite_Utils (Runner => Runner);
   use Utils; -- Runner_Array, Test_Method_Array, Name_Array, "+"

   Methods : constant Test_Method_Array :=
     (
      1 => Test_Initialization'Access
      ,
      2 => Test_Formatted_Text'Access
     );

   Names : constant Name_Array (Methods'Range) :=
     (
      1 => +"Test_Initialization"
      ,
      2 => +"Test_Formatted_Text"
     );

   function Suite return AUnit.Test_Suites.Access_Test_Suite;

end Model.Comment.Suites;
