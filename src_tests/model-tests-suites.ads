with AUnit.Test_Suites;

with Model.Comment.Suites;
with Model.Element.Dummy.Suites;
--  with Model.Named_Element.Dummy.Suites;
--  with Model.Parameter.Suites;
--  with Model.Package_Def.Suites;

package Model.Tests.Suites is

   function Suite return AUnit.Test_Suites.Access_Test_Suite;

   type Suite_Array_T is array (Positive range <>) of AUnit.Test_Suites.Access_Test_Suite;

   Suites : constant Suite_Array_T :=
     (
      Model.Element.Dummy.Suites.Suite
      ,
      Model.Comment.Suites.Suite
      --  ,
      --  Model.Named_Element.Dummy.Suites.Suite
      --  ,
      --  Model.Parameter.Suites.Suite
      --  ,
      --  Model.Package_Def.Suites.Suite
     );

end Model.Tests.Suites;
