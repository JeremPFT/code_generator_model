with Ada.Containers.Vectors;

limited with Model.Comment;
--  limited with Model.Visitor;

package Model.Element is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is abstract tagged private;

   -----------------------------------------------------------------------------
   --  initialization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self : in out Object_T);
   --  does nothing, defined for heriting classes

   pragma Precondition (Initial_State (Self'Access));

   pragma Postcondition (Initial_State (Self'Access));

   -----------------------------------------------------------------------------
   --  owned elements
   -----------------------------------------------------------------------------

   ---------------------------
   --  Owned_Element_Count  --
   ---------------------------

   not overriding
   function Owned_Element_Count
     (Self : in Object_T)
     return Natural;

   -------------------------
   --  Get_Owned_Element  --
   -------------------------

   not overriding
   function Get_Owned_Element
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Object_T'Class;

   pragma Precondition
     (Index <= Self.Owned_Element_Count);

   --------------------
   --  Owns_Element  --
   --------------------

   not overriding
   function Owns_Element
     (Self    : in              Object_T;
      Element : not null access constant Object_T'Class)
     return Boolean;

   -------------------------
   --  Add_Owned_Element  --
   -------------------------

   not overriding
   procedure Add_Owned_Element
     (Self  : in out Object_T;
      Child : not null access constant Object_T'Class);

   pragma Precondition
     (Child /= null);

   pragma Postcondition
     (Self.Owned_Element_Count = Self'Old.Owned_Element_Count + 1
        and then Self.Get_Owned_Element (Self.Owned_Element_Count) = Child);

   -----------------------------------------------------------------------------
   --  owned comments
   -----------------------------------------------------------------------------

   ---------------------
   --  Comment_Count  --
   ---------------------

   not overriding
   function Comment_Count
     (Self : in Object_T)
     return Natural;

   -------------------
   --  Get_Comment  --
   -------------------

   not overriding
   function Get_Comment
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Model.Comment.Object_T'Class;

   pragma Precondition
     (Index <= Self.Comment_Count);

   --------------------
   --  Owns_Comment  --
   --------------------

   not overriding
   function Owns_Comment
     (Self    : in              Object_T;
      Comment : not null access constant Model.Comment.Object_T'Class)
     return Boolean;

   -------------------
   --  Add_Comment  --
   -------------------

   not overriding
   procedure Add_Comment
     (Self    : in out          Object_T;
      Comment : not null access constant Model.Comment.Object_T'Class);

   pragma Precondition
     (not Self.Owns_Comment (Comment));

   pragma Postcondition
     (Self.Comment_Count = Self'Old.Comment_Count + 1
        and then Self.Get_Comment (Self.Comment_Count) = Comment);

   -----------------------------------------------------------------------------
   --  owner
   -----------------------------------------------------------------------------

   -----------------
   --  Has_Owner  --
   -----------------

   not overriding
   function Has_Owner
     (Self  : in Object_T)
     return Boolean;

   -----------------
   --  Get_Owner  --
   -----------------

   not overriding
   function Get_Owner
     (Self  : in Object_T)
     return not null access constant Object_T'Class;

   pragma Precondition (Self.Has_Owner);

   -------------------
   --  is_Owned_By  --
   -------------------

   not overriding
   function Is_Owned_By
     (Self   : in              Object_T;
      Parent : not null access constant Object_T'Class)
     return Boolean;

   ---------------------
   --  Must_Be_Owned  --
   ---------------------

   not overriding
   function Must_Be_Owned
     (Self:  in Object_T)
     return Boolean
     is (True);

   --  -----------------------------------------------------------------------------
   --  --  visitor
   --  -----------------------------------------------------------------------------

   --  -------------
   --  --  Visit  --
   --  -------------

   --  not overriding
   --  procedure Visit
   --    (Self   : in out Object_T;
   --     Object : in out Visitor.Object_T'Class);

   function Initial_State
     (Self : access constant Object_T)
     return Boolean
     is (Self.Comment_Count = 0
           and then Self.Owned_Element_Count = 0
           and then not Self.Has_Owner);

private

   type Element_Access_T is access all Object_T;

   type Element_Class_Access_T is access all Object_T'Class;

   package Element_Vectors is new Ada.Containers.Vectors
     (Element_Type => Element_Class_Access_T,
      Index_Type   => Positive);

   type Comment_Access_T is access all Comment.Object_T;

   type Comment_Class_Access_T is access all Comment.Object_T'Class;

   package Comment_Vectors is new Ada.Containers.Vectors
     (Element_Type => Comment_Class_Access_T,
      Index_Type   => Positive);

   type Object_T is abstract tagged record
      Owned_Comments : Comment_Vectors.Vector
        := Comment_Vectors.Empty_Vector;

      Owned_Elements : Element_Vectors.Vector
        := Element_Vectors.Empty_Vector;

      Owner : access Object_T'Class := null;
   end record;

end Model.Element;
