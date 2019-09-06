with Model.Named_Element;

package Model.Package_Def is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element;

   type Object_T is new Parent_Pkg.Object_T with private;

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self              : in out Object_T'Class;
      Name              : in     String := "";
      Dependancies_Todo : in     String := "";
      Classes_Todo      : in     String := "");

   pragma Precondition
     (Name /= "");

   pragma Postcondition
     (Self.Get_Name = Name);

private

   type Object_T is new Parent_Pkg.Object_T with
     null record;

end Model.Package_Def;
