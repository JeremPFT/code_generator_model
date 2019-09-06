with AUnit.Test_Caller;
with AUnit.Test_Suites;

with Suite_Utils;

with Model.Element.Dummy.Tests;
use Model.Element.Dummy.Tests; --  test fixtures & routines

package Model.Element.Dummy.Suites is

   Test_Unit_Name : constant String := "Model.Element.Dummy";

   package Runner is new AUnit.Test_Caller
     (Test_Fixture => Element.Dummy.Tests.Test_Fixture);

   package Utils is new Suite_Utils (Runner => Runner);
   use Utils; -- Runner_Array, Test_Method_Array, Name_Array, "+"

   Methods : constant Test_Method_Array :=
     (
      1 => Test_Initialization'Access
      ,
      2 => Test_Add_Comment'Access
      ,
      3 => Test_Get_Comment_Nominal'Access
      ,
      4 => Test_Get_Comment_Out_Of_Bound'Access
     );

   Names : constant Name_Array (Methods'Range) :=
     (
      1 => +"Test_Initialization"
      ,
      2 => +"Test_Add_Comment"
      ,
      3 => +"Test_Get_Comment_Nominal"
      ,
      4 => +"Test_Get_Comment_Out_Of_bound"
     );

   function Suite return AUnit.Test_Suites.Access_Test_Suite;

end Model.Element.Dummy.Suites;
