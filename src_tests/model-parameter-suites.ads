with AUnit.Test_Caller;
with AUnit.Test_Suites;

with Suite_Utils;

package Model.Parameter.Tests.Suites is
   
   package Runner is new AUnit.Test_Caller
     (Test_Fixture => Model.Parameter.Tests.Test);
   
   package Utils is new Suite_Utils (Runner => Runner);
   use Utils; -- Runner_Array, Test_Method_Array, Name_Array, "+"
   
   Methods : constant Test_Method_Array :=
     (
      Test_Add_Comment'Access,
      Test_Initialization'Access,
      Test_Is_Namespace'Access,
      Test_Is_Packageable'Access
     );
   
   Test_Unit_Name : constant String := "Parameter";
   
   Names : constant Name_Array (Methods'Range) :=
     (
      +"Test_Add_Comment",
      +"Test_Initialization",
      +"Test_Is_Namespace",
      +"Test_Is_Packageable"
     );
   
   function Suite return AUnit.Test_Suites.Access_Test_Suite;
   
end Model.Parameter.Tests.Suites;
