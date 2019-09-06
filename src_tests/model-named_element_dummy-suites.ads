with AUnit.Test_Caller;
with AUnit.Test_Suites;

with Suite_Utils;

package Model.Named_Element_Dummy.Tests.Suites is

   package Runner is new AUnit.Test_Caller
     (Test_Fixture => Model.Named_Element_Dummy.Tests.Test);

   package Utils is new Suite_Utils (Runner => Runner);
   use Utils; -- Runner_Array, Test_Method_Array, Name_Array, "+"

   Methods : constant Test_Method_Array :=
     (
      1 => Test_Initialization'Access
      ,
      2 => Test_Is_Namespace'Access
     );

   Test_Unit_Name : constant String := "Named_Element_Dummy";

   Names : constant Name_Array (Methods'Range) :=
     (
      1 => +"Test_Initialization"
      ,
      2 => +"Test_Is_Namespace"
     );

   function Suite return AUnit.Test_Suites.Access_Test_Suite;

end Model.Named_Element_Dummy.Tests.Suites;
