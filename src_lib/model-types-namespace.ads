with Ada.Containers.Vectors;

limited with Model.Namespace;

package Model.Types.Namespace is

   type Namespace_Class_T is access all Model.Namespace.Object_T'Class;

   type Namespace_Array_T is array (Positive range <>)
     of not null access constant Model.Namespace.Object_T'Class;

   package Namespace_Vectors is new Ada.Containers.Vectors
     (Element_Type => Namespace_Class_T,
      Index_Type   => Positive);

   subtype Namespace_Vector_T is Namespace_Vectors.Vector;

end Model.Types.Namespace;
