with Model.Named_Element;
with Model.Types.Named_Element; use Model.Types.Named_Element;

package Model.Namespace is

   -----------------------------------------------------------------------------
   --  interface definition
   -----------------------------------------------------------------------------

   type Interface_T is Interface;

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   not overriding
   function Get_Qualified_Name
     (Self : in Interface_T)
     return String
      is abstract;

   -------------------------------
   --  Number_Of_Owned_Members  --
   -------------------------------

   not overriding
   function Number_Of_Owned_Members
     (Self : in Interface_T)
     return Natural
      is abstract;

   ------------------------
   --  Get_Owned_Member  --
   ------------------------

   not overriding
   function Get_Owned_Member
     (Self  : in Interface_T;
      Index : in Positive)
     return not null access Named_Element.Object_T'Class
      is abstract;

   -----------------------------------------------------------------------------
   --  commands
   -----------------------------------------------------------------------------

   ------------------------
   --  Add_Owned_Member  --
   ------------------------

   not overriding
   procedure Add_Owned_Member
     (Self  : in out Interface_T;
      Child : access constant Named_Element.Object_T'Class)
      is abstract;

   -----------------------------------------------------------------------------
   --  class definition
   -----------------------------------------------------------------------------

   type Object_T is abstract new Named_Element.Object_T and Interface_T with private;

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   overriding
   function Get_Qualified_Name
     (Self : in Object_T)
     return String;

   -------------------------------
   --  Number_Of_Owned_Members  --
   -------------------------------

   overriding
   function Number_Of_Owned_Members
     (Self : in Object_T)
     return Natural;

   ------------------------
   --  Get_Owned_Member  --
   ------------------------

   overriding
   function Get_Owned_Member
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Named_Element.Object_T'Class;

   pragma Precondition
     (Index <= Self.Number_Of_Owned_Members);

   -----------------------------------------------------------------------------
   --  commands
   -----------------------------------------------------------------------------

   ------------------------
   --  Add_Owned_Member  --
   ------------------------

   overriding
   procedure Add_Owned_Member
     (Self  : in out Object_T;
      Child : access constant Named_Element.Object_T'Class);

   pragma Precondition
     (Child /= null);

   pragma Postcondition
     (Self.Number_Of_Owned_Members = Self'Old.Number_Of_Owned_Members + 1
        and then Self.Get_Owned_Member (Self.Number_Of_Owned_Members) = Child);

private

   type Object_T is abstract new Named_Element.Object_T and Interface_T
     with record
        Owned_Members : Named_Element_Vector_T
          := Named_Element_Vectors.Empty_Vector;
   end record;

end Model.Namespace;
