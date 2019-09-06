with Ada.Containers.Vectors;

limited with Model.Class_Def;

package Model.Types.Class_Def is

   type Class_Def_Class_T is access all Model.Class_Def.Object_T'Class;

   type Class_Def_Array_T is array (Positive range <>)
     of not null access constant Model.Class_Def.Object_T'Class;

   package Class_Def_Vectors is new Ada.Containers.Vectors
     (Element_Type => Class_Def_Class_T,
      Index_Type   => Positive);

   subtype Class_Def_Vector_T is Class_Def_Vectors.Vector;

end Model.Types.Class_Def;
