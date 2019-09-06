with Ada.Containers.Vectors;

limited with Model.Comment;

package Model.Types.Comment is

   type Comment_Class_T is access all Model.Comment.Object_T'Class;

   type Comment_Array_T is array (Positive range <>)
     of not null access constant Model.Comment.Object_T'Class;

   package Comment_Vectors is new Ada.Containers.Vectors
     (Element_Type => Comment_Class_T,
      Index_Type   => Positive);

   subtype Comment_Vector_T is Comment_Vectors.Vector;

end Model.Types.Comment;
