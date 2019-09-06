package body Model.Namespace is

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   overriding
   function Get_Qualified_Name
     (Self : in Object_T)
     return String
   is begin
      return Self.Get_Name;
   end Get_Qualified_Name;

   -------------------------------
   --  Number_Of_Owned_Members  --
   -------------------------------

   overriding
   function Number_Of_Owned_Members
     (Self : in Object_T)
     return Natural
   is begin
      return Natural (Self.Owned_Members.Length);
   end Number_Of_Owned_Members;

   ------------------------
   --  Get_Owned_Member  --
   ------------------------

   overriding
   function Get_Owned_Member
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Named_Element.Object_T'Class
   is begin
      if Index > Self.Number_Of_Owned_Members then
         raise Out_Of_Bound;
      end if;

      return Self.Owned_Members (Index);
   end Get_Owned_Member;

   ------------------------
   --  Add_Owned_Member  --
   ------------------------

   overriding
   procedure Add_Owned_Member
     (Self  : in out Object_T;
      Child : access constant Named_Element.Object_T'Class)
   is begin
      Self.Owned_Members.Append (New_Item => Child);
   end Add_Owned_Member;

end Model.Namespace;
