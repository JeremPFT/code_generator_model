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

   --------------------------
   --  Owned_Member_Count  --
   --------------------------

   overriding
   function Owned_Member_Count
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
     (Index <= Self.Owned_Member_Count);

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
     (Self.Owned_Member_Count = Self'Old.Owned_Member_Count + 1
        and then Self.Get_Owned_Member (Self.Owned_Member_Count) = Child);

private

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is new Parent_Pkg.Object_T
     and Model.Namespace.Interface_T
   with record
      Namespace : access Model.Namespace.Object_T;
   end record;

end Model.Class_Def;
