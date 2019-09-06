with AUnit.Test_Caller;
with AUnit.Test_Suites;

with Suite_Utils;

package Model.Package_Def.Tests.Suites is
   
   package Runner is new AUnit.Test_Caller
     (Test_Fixture => Model.Package_Def.Tests.Test);
   
   package Utils is new Suite_Utils (Runner => Runner);
   use Utils; -- Runner_Array, Test_Method_Array, Name_Array, "+"
   
   Methods : constant Test_Method_Array :=
     (
      Test_Initialization'Access,
      Test_Add_Comment'Access,
      Test_Is_Namespace'Access,
      Test_Is_Packageable'Access,
      Test_Add_Member'Access
     );
   
   Test_Unit_Name : constant String := "Package_Def";
   
   Names : constant Name_Array (Methods'Range) :=
     (
      +"Test_Initialization",
      +"Test_Add_Comment",
      +"Test_Is_Namespace",
      +"Test_Is_Packageable",
      +"Test_Add_Member"
     );
   
   function Suite return AUnit.Test_Suites.Access_Test_Suite;
   
end Model.Package_Def.Tests.Suites;
