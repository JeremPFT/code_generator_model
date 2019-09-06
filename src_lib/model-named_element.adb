package body Model.Named_Element is

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self : in out Object_T'Class;
      Name : in     String := "")
   is
   begin
      declare
         String_Object : constant String_Access_T := new String'(Name);
      begin
         Self.Name := String_Object;
      end;
   end Initialize;

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   not overriding
   function Get_Qualified_Name
     (Self : in Object_T)
     return String
   is
   begin
      return Self.Get_Name;
   end Get_Qualified_Name;

   ---------------------
   --  Has_Namespace  --
   ---------------------

   not overriding
   function Has_Namespace
     (Self : in Object_T)
     return Boolean
     is (Self.Namespace /= null);

   ---------------------
   --  Get_Namespace  --
   ---------------------

   not overriding
   function Get_Namespace
     (Self : in Object_T)
     return not null access constant Model.Namespace.Object_T'Class
   is begin
      return Self.Namespace;
   end Get_Namespace;

end Model.Named_Element;
