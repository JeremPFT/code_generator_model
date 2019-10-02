with Model.Comment;

package body Model.Element is

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self : in out Object_T)
   is
   begin
      null;
   end Initialize;

   --------------------
   -- Comment_Count  --
   --------------------

   function Comment_Count
     (Self : in Object_T)
     return Natural
   is
   begin
      return Natural (Self.Owned_Comments.Length);
   end Comment_Count;

   -------------------
   --  Get_Comment  --
   -------------------

   function Get_Comment
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Model.Comment.Object_T'Class
   is
   begin
      if Index > Self.Comment_Count then
         raise Out_Of_Bound;
      end if;

      return Self.Owned_Comments (Index);
   end Get_Comment;

   -------------------
   --  Add_Comment  --
   -------------------

   not overriding
   procedure Add_Comment
     (Self    : in out Object_T;
      Comment : not null access constant Model.Comment.Object_T'Class)
   is
   begin
      if Self.Comment_Count = Positive'Last then
         raise Out_Of_Bound;
      end if;

      Self.Owned_Comments.Append (New_Item => Comment);
   end Add_Comment;

   -----------------
   --  Has_Owner  --
   -----------------

   function Has_Owner
     (Self  : in Object_T)
     return Boolean
   is
   begin
      return Self.Owner /= null;
   end Has_Owner;

   --------------------
   --  Owns_Comment  --
   --------------------

   not overriding
   function Owns_Comment
     (Self    : in              Object_T;
      Comment : not null access constant Model.Comment.Object_T'Class)
     return Boolean
   is
   begin
      return Self.Owned_Comments.Contains (Comment);
   end Owns_Comment;

   --------------------
   --  Owns_Element  --
   --------------------

   not overriding
   function Owns_Element
     (Self    : in              Object_T;
      Element : not null access constant Object_T'Class)
     return Boolean
   is
   begin
      return Self.Owned_Elements.Contains (Element);
   end Owns_Element;

   ----------------
   --  Is_Owned  --
   ----------------

   not overriding
   function Is_Owned_By
     (Self   : in              Object_T;
      Parent : not null access constant Object_T'Class)
     return Boolean
   is
      Obj_Access : constant access constant Object_T'Class := Self'Access;
   begin
      return Parent.Owns_Element (Element => Obj_Access);
   end Is_Owned_By;

   -----------------
   --  Get_Owner  --
   -----------------

   function Get_Owner
     (Self  : in Object_T)
     return not null access constant Object_T'Class
   is
   begin
      return Self.Owner;
   end Get_Owner;

   -------------------------
   --  Add_Owned_Element  --
   -------------------------

   procedure Add_Owned_Element
     (Self  : in out Object_T;
      Child : not null access constant Object_T'Class)
   is
   begin
      if Self.Owned_Element_Count = Positive'Last then
         raise Out_Of_Bound;
      end if;

      Self.Owned_Elements.Append (New_Item => Child);
   end Add_Owned_Element;

   ---------------------------
   --  Owned_Element_Count  --
   ---------------------------

   function Owned_Element_Count
     (Self : in Object_T)
     return Natural
   is
   begin
      return Natural (Self.Owned_Elements.Length);
   end Owned_Element_Count;

   -------------------------
   --  Get_Owned_Element  --
   -------------------------

   function Get_Owned_Element
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Object_T'Class
   is
   begin
      if Index > Self.Owned_Element_Count then
         raise Out_Of_Bound;
      end if;

      declare
         Tmp_Element : constant access Object_T'Class :=
           Self.Owned_Elements (Index);
      begin
         return Tmp_Element;
      end;
   end Get_Owned_Element;

   --  -------------
   --  --  Visit  --
   --  -------------

   --  procedure Visit
   --    (Self   : in out Object_T;
   --     Object : in out Visitor.Object_T'Class)
   --  is
   --  begin
   --     Object.Visit_Element (Self);
   --  end Visit;

end Model.Element;
