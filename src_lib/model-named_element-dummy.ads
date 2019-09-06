with Ada.Containers.Vectors;

with Model.Named_Element;
--  with Model.Visitor;
--  limited with Model.Package_Def;

package Model.Named_Element.Dummy is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element;

   type Object_T is new Parent_Pkg.Object_T with private;

   type Dummy_Class_T is access all Object_T'Class;

   type Dummy_Array_T is array (Positive range <>) of
     not null access constant Object_T'Class;

   package Dummy_Vectors is new Ada.Containers.Vectors
     (Element_Type => Dummy_Class_T,
      Index_Type   => Positive);

   subtype Dummy_Vector_T is Dummy_Vectors.Vector;

   subtype Visibility_T is Model.Named_Element.Visibility_T;

   Visibility_None      : Visibility_T
     renames Model.Named_Element.Visibility_None;
   Visibility_Private   : Visibility_T
     renames Model.Named_Element.Visibility_Private;
   Visibility_Protected : Visibility_T
     renames Model.Named_Element.Visibility_Protected;
   Visibility_Public    : Visibility_T
     renames Model.Named_Element.Visibility_Public;
   Visibility_Package   : Visibility_T
     renames Model.Named_Element.Visibility_Package;

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   --------------
   --  Create  --
   --------------

   function Create
     (Name : in String := "")
     return not null access Object_T'Class;

   pragma Precondition
     (Name /= "");

   pragma Postcondition
     (Create'Result.Get_Name = Name);

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

private

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is new Parent_Pkg.Object_T
     with null record;

end Model.Named_Element.Dummy;
