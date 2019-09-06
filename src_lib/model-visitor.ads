with Ada.Containers.Vectors;

limited with Model.Comment;
--  limited with Model.Dependency;
limited with Model.Element;
limited with Model.Named_Element;
--  limited with Model.Field;
--  limited with Model.Namespace;
--  limited with Model.Operation;
--  limited with Model.Package_Def;
--  limited with Model.Parameter;
--  limited with Model.Project;
--  limited with Model.Parent_Project;
--  limited with Model.Types.Class_Def;
--  limited with Model.Types.Interface_Def;

package Model.Visitor is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is abstract tagged null record;

   type Access_T is access all Object_T;

   type Class_T is access all Object_T'Class;

   type Array_T is array (Positive range <>) of Class_T;

   package Vectors is new Ada.Containers.Vectors
     (Element_Type => Class_T,
      Index_Type   => Positive);

   subtype Vector_T is Vectors.Vector;

   -----------------------------------------------------------------------------
   --  commands
   -----------------------------------------------------------------------------

   --  procedure Visit_Class
   --    (Self   : in out Object_T;
   --     Object : in out Model.Types.Class_Def.Object_T'Class)
   --    is abstract;

   procedure Visit_Comment
     (Self   : in out Object_T;
      Object : in out Model.Comment.Object_T'Class)
     is abstract;

   --  procedure Visit_Dependency
   --    (Self   : in out Object_T;
   --     Object : in out Model.Dependency.Object_T'Class)
   --    is abstract;

   procedure Visit_Element
     (Self   : in out Object_T;
      Object : in out Model.Element.Object_T'Class)
     is abstract;

   procedure Visit_Named_Element
     (Self   : in out Object_T;
      Object : in out Model.Named_Element.Object_T'Class)
     is abstract;

   --  procedure Visit_Field
   --    (Self   : in out Object_T;
   --     Object : in out Model.Field.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Interface
   --    (Self   : in out Object_T;
   --     Object : in out Model.Types.Interface_Def.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Namespace
   --    (Self   : in out Object_T;
   --     Object : in out Model.Namespace.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Operation
   --    (Self   : in out Object_T;
   --     Object : in out Model.Operation.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Package
   --    (Self   : in out Object_T;
   --     Object : in out Model.Package_Def.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Parameter
   --    (Self   : in out Object_T;
   --     Object : in out Model.Parameter.Object_T'Class)
   --    is abstract;

   --  procedure Visit_Project
   --    (Self   : in out Object_T;
   --     Object : in out Model.Project.Object_T'Class)
   --    is abstract;

end Model.Visitor;
