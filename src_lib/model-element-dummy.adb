with Model.Comment;

package body Model.Element.Dummy is

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self : in out Object_T'Class)
   is
   begin
      Model.Element.Initialize (Self);
   end Initialize;

   --------------
   --  Create  --
   --------------

   function Create
     return not null access Object_T'Class
   is
      Result : constant Dummy_Class_T := new Object_T;
   begin
      Dummy.Initialize (Result.all);
      return Result;
   end Create;

end Model.Element.Dummy;
