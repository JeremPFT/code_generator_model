with Model.Named_Element;

package Model.Package_Def is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element;

   subtype Parent_T is Parent_Pkg.Object_T;

   type Object_T is new Parent_T with private;

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   not overriding
   procedure Initialize
   (Self              : in out Object_T;
    Name              : in     String;
    Dependancies_Todo : in     String := "";
    Classes_Todo      : in     String := "");

   pragma Precondition
   (Name /= "");

   pragma Postcondition
   (Self.Get_Name = Name);

   --------------
   --  Create  --
   --------------

   function Create
   (Name              : in     String;
    Dependancies_Todo : in     String := "";
    Classes_Todo      : in     String := "")
   return not null access Object_T'Class;

   pragma Precondition
   (Name /= "");

   pragma Postcondition
   (Create'Result.Get_Name = Name);

private

   type Object_T is new Parent_Pkg.Object_T with
   null record;

end Model.Package_Def;
