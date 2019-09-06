with Model.Named_Element;
with Model.Namespace;
--  with Model.Visitor;
--  limited with Model.Package_Def;

package Model.Class_Def is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Named_Element;

   type Object_T is new Parent_Pkg.Object_T
     and Model.Namespace.Interface_T
     with private;

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   --------------
   --  Create  --
   --------------

   function Create
     (Name : in String := "")
     return not null access Object_T'Class;

   pragma Precondition
     (Name /= "");

   pragma Postcondition
     (Create'Result.Get_Name = Name);

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

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is new Parent_Pkg.Object_T
     and Model.Namespace.interface_T
   with record
      Namespace : access Model.Namespace.Object_T;
   end record;

end Model.Class_Def;
