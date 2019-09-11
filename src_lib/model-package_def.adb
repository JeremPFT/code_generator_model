package body Model.Package_Def is

   ------------------
   --  Initialize  --
   ------------------

   not overriding
   procedure Initialize
   (Self              : in out Object_T;
    Name              : in     String;
    Dependancies_Todo : in     String := "";
    Classes_Todo      : in     String := "")
   is
      pragma Unreferenced (Dependancies_Todo, Classes_Todo);
   begin
      Parent_T (Self).Initialize (Name => Name);
   end Initialize;

   --------------
   --  Create  --
   --------------

   function Create
   (Name              : in     String;
    Dependancies_Todo : in     String := "";
    Classes_Todo      : in     String := "")
   return not null access Object_T'Class
   is
      Result : constant access Object_T'Class := new Object_T;
   begin
      Result.Initialize (Name, Dependancies_Todo, Classes_Todo);
      return Result;
   end Create;

end Model.Package_Def;
