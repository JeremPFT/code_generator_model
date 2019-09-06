package body Model.Package_Def is

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self              : in out Object_T'Class;
      Name              : in     String := "";
      Dependancies_Todo : in     String := "";
      Classes_Todo      : in     String := "")
   is
      pragma Unreferenced (Dependancies_Todo, Classes_Todo);
   begin
      Parent_Pkg.Initialize (Self => Self, Name => Name);
   end Initialize;


end Model.Package_Def;
