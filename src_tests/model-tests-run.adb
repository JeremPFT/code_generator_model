with GNAT.Traceback.Symbolic;
with GNAT.Traceback;
with System.Assertions;

with Ada.Exceptions;

with AUnit.Run;
with AUnit.Reporter.Text;

with Model.Tests.Suites;

procedure Model.Tests.Run is

   package T_IO renames Ada.Text_IO;

   procedure Call_Stack is
      Trace  : GNAT.Traceback.Tracebacks_Array (1..1_000);
      Length : Natural;
   begin
      GNAT.Traceback.Call_Chain (Trace, Length);
      T_IO.Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (Trace (1..Length)));
   end Call_Stack;

   procedure Run is new AUnit.Run.Test_Runner (Model.Tests.Suites.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;

   use Ada.Exceptions;

begin
   T_IO.New_Line (2);
   T_IO.Put_Line ("=====================");
   T_IO.Put_Line ("==  running tests  ==");
   T_IO.Put_Line ("=====================");

   Run (Reporter);

   T_IO.New_Line;
   T_IO.Put_Line ("====================");
   T_IO.Put_Line ("==  end of tests  ==");
   T_IO.Put_Line ("====================");

exception
  when Error: System.Assertions.Assert_Failure =>
     Call_Stack;
     T_IO.Put ("ASSERT exception: ");
     T_IO.Put_Line (Exception_Information (Error));
     --  raise;

  when Error: others =>
     Call_Stack;
     T_IO.Put ("Unexpected exception: ");
     T_IO.Put_Line (Exception_Information (Error));
      --  raise;
end Model.Tests.Run;
