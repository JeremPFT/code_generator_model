with Ada.Containers.Vectors;

limited with Model.Element;

package Model.Types.Element is

   type Element_Class_T is access all Model.Element.Object_T'Class;

   type Element_Array_T is array (Positive range <>)
     of not null access constant Model.Element.Object_T'Class;

   package Element_Vectors is new Ada.Containers.Vectors
     (Element_Type => Element_Class_T,
      Index_Type   => Positive);

   subtype Element_Vector_T is Element_Vectors.Vector;

end Model.Types.Element;
