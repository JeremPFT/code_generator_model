package body Model.Tests.Suites is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   -------------
   --  Suite  --
   -------------

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin
      for J in Suites'Range loop
         Result.Add_Test (Suites (J));
      end loop;

      return Result'Access;
   end Suite;

end Model.Tests.Suites;
