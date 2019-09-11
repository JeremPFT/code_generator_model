with Ada.Containers.Vectors;

limited with Model.Package_Def;

package Model.Types.Package_Def is

   type Package_Def_Class_T is access all Model.Package_Def.Object_T'Class;

   type Package_Def_Array_T is array (Positive range <>)
   of not null access constant Model.Package_Def.Object_T'Class;

   package Package_Def_Vectors is new Ada.Containers.Vectors
   (Element_Type => Package_Def_Class_T,
    Index_Type   => Positive);

   subtype Package_Def_Vector_T is Package_Def_Vectors.Vector;

end Model.Types.Package_Def;
