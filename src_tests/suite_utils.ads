with Ada.Strings.Unbounded;

with AUnit.Test_Caller;

generic
   with package Runner is new AUnit.Test_Caller (<>);
package Suite_Utils is
   type Runner_Array is array (Positive range <>)
     of aliased Runner.Test_Case;

   type Test_Method_Array is array (Positive range <>)
     of Runner.Test_Method;

   type Name_Array is array (Positive range <>)
     of Ada.Strings.Unbounded.Unbounded_String;

   function "+" (Source : String) return Ada.Strings.Unbounded.Unbounded_String
     renames Ada.Strings.Unbounded.To_Unbounded_String;

   function "+" (Source : Ada.Strings.Unbounded.Unbounded_String) return String
     renames Ada.Strings.Unbounded.To_String;

   end Suite_Utils;
