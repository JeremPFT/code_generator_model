package body Model.Parameter.Tests.Suites is
   
   ----------------------------------------------------------------------------
   
   Result : aliased AUnit.Test_Suites.Test_Suite;
   
   Runners : Runner_Array (Methods'Range) := (others => <>);
   
   ----------------------------------------------------------------------------
   
   -------------
   --  Suite  --
   -------------
   
   function Suite return AUnit.Test_Suites.Access_Test_Suite
   is
   begin
      for J in Runners'Range loop
         Runner.Create (Runners (J),
                        Test_Unit_Name & ": " & (+Names (J)),
                        Methods (J));
         Result.Add_Test (Runners (J)'Access);
      end loop;
      
      return Result'Access;
   end Suite;
   
end Model.Parameter.Tests.Suites;
