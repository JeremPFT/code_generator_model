with Ada.Containers.Vectors;

limited with Model.Named_Element;

package Model.Types.Named_Element is

   type Named_Element_Class_T is access all Model.Named_Element.Object_T'Class;

   type Named_Element_Array_T is array (Positive range <>)
     of not null access constant Model.Named_Element.Object_T'Class;

   package Named_Element_Vectors is new Ada.Containers.Vectors
     (Element_Type => Named_Element_Class_T,
      Index_Type   => Positive);

   subtype Named_Element_Vector_T is Named_Element_Vectors.Vector;

end Model.Types.Named_Element;
