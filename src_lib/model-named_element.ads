with Model.Element;
limited with Model.Namespace;

--  with Model.Visitor;
--  limited with Model.Package_Def;

package Model.Named_Element is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Element;

   type Object_T is abstract new Parent_Pkg.Object_T with private;

   type Visibility_T is (Visibility_None,
                         Visibility_Private,
                         Visibility_Protected,
                         Visibility_Public,
                         Visibility_Package);

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self : in out Object_T'Class;
      Name : in     String := "");

   pragma Precondition
     (Name /= "");

   pragma Postcondition
     (Self.Get_Name = Name);

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   ----------------
   --  Get_Name  --
   ----------------

   not overriding
   function Get_Name
     (Self : in Object_T)
     return String;

   ---------------------
   --  Has_Namespace  --
   ---------------------

   not overriding
   function Has_Namespace
     (Self : in Object_T)
     return Boolean;

   ---------------------
   --  Get_Namespace  --
   ---------------------

   --  not overriding
   function Get_Namespace
     (Self : in Object_T)
     return not null access constant Model.Namespace.Object_T'Class;

   pragma Precondition
     (Self.Has_Namespace);

   --------------------------
   --  Get_Qualified_Name  --
   --------------------------

   not overriding
   function Get_Qualified_Name
     (Self : in Object_T)
     return String;

private

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is abstract new Parent_Pkg.Object_T
   with record
      --  Name      : String_Access_T                       := null;
      Name      : access String                         := null;
      Namespace : access Model.Namespace.Object_T'Class := null;
   end record;

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   ----------------
   --  Get_Name  --
   ----------------

   not overriding
   function Get_Name
     (Self : in Object_T)
     return String
     is (if Self.Name = null then ""
         else Self.Name.all);

end Model.Named_Element;
