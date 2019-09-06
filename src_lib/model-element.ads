limited with Model.Comment;
--  limited with Model.Visitor;

with Model.Types.Element; use Model.Types.Element;
with Model.Types.Comment; use Model.Types.Comment;

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
     (Self : in out Object_T'Class);

   pragma Postcondition
     (Self.Number_Of_Comments = 0
        and then Self.Number_Of_Owned_Elements = 0);

   -----------------------------------------------------------------------------
   --  owned elements
   -----------------------------------------------------------------------------

   --------------------------------
   --  Number_Of_Owned_Elements  --
   --------------------------------

   not overriding
   function Number_Of_Owned_Elements
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
     (Index <= Self.Number_Of_Owned_Elements);

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
     (Self.Number_Of_Owned_Elements = Self'Old.Number_Of_Owned_Elements + 1
        and then Self.Get_Owned_Element (Self.Number_Of_Owned_Elements) = Child);

   -----------------------------------------------------------------------------
   --  owned comments
   -----------------------------------------------------------------------------

   --------------------------
   --  Number_Of_Comments  --
   --------------------------

   not overriding
   function Number_Of_Comments
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
     (Index <= Self.Number_Of_Comments);

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
     (Self.Number_Of_Comments = Self'Old.Number_Of_Comments + 1
        and then Self.Get_Comment (Self.Number_Of_Comments) = Comment);

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

private

   type Object_T is abstract tagged record
      Owned_Comments : Comment_Vector_T
        := Comment_Vectors.Empty_Vector;

      Owned_Elements : Element_Vector_T
        := Element_Vectors.Empty_Vector;

      Owner : access Object_T'Class := null;
   end record;

end Model.Element;
