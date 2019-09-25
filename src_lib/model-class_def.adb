with Model.Types.Class_Def; use Model.Types.Class_Def;
with Model.Types.Named_Element; use Model.Types.Named_Element;

package body Model.Class_Def is

   --------------
   --  Create  --
   --------------

   function Create
     (Name : in String := "")
     return not null access Object_T'Class
   is
      Result : constant Named_Element_Class_T := new Object_T;
   begin
      Result.Initialize (Name => Name);
      return Class_Def_Class_T (Result);
   end Create;

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   overriding
   function Get_Qualified_Name
     (Self : in Object_T)
     return String
   is begin
      return Self.Namespace.Get_Qualified_Name;
   end Get_Qualified_Name;

   --------------------------
   --  Owned_Member_Count  --
   --------------------------

   overriding
   function Owned_Member_Count
     (Self : in Object_T)
     return Natural
   is begin
      return Self.Namespace.Owned_Member_Count;
   end Owned_Member_Count;

   ------------------------
   --  Get_Owned_Member  --
   ------------------------

   overriding
   function Get_Owned_Member
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Named_Element.Object_T'Class
   is begin
      return Self.Namespace.Get_Owned_Member (Index);
   end Get_Owned_Member;

   ------------------------
   --  Add_Owned_Member  --
   ------------------------

   overriding
   procedure Add_Owned_Member
     (Self  : in out Object_T;
      Child : access constant Named_Element.Object_T'Class)
   is begin
      Self.Namespace.Add_Owned_Member (Child => Child);
   end Add_Owned_Member;

end Model.Class_Def;
