with Ada.Containers.Vectors;

limited with Model.Project;

package Model.Types.Project is

   type Project_Class_T is access all Model.Project.Object_T'Class;

   type Project_Array_T is array (Positive range <>)
   of not null access constant Model.Project.Object_T'Class;

   package Project_Vectors is new Ada.Containers.Vectors
   (Element_Type => Project_Class_T,
    Index_Type   => Positive);

   subtype Project_Vector_T is Project_Vectors.Vector;

end Model.Types.Project;
