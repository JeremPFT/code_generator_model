with Model.Types.Package_Def; use Model.Types.Package_Def;
with Model.Package_Def;

package Model.Project is

   type Object_T is tagged private;

   ------------------
   --  Initialize  --
   ------------------

   not overriding
   procedure Initialize
     (Self             : in out Object_T;
      Name             : in String;
      Output_Directory : in String;
      Package_List     : in Package_Def_Vector_T);

   pragma Precondition
     (Name /= ""
        and then Output_Directory /= "");

   pragma Postcondition
     (Self.Get_Name = Name
        and then Self.Get_Output_Directory = Output_Directory
        and then Self.Number_Of_Packages = Integer (Package_List.Length));

   --------------
   --  Create  --
   --------------

   function Create
     (Name             : in String;
      Output_Directory : in String;
      Package_List     : in Package_Def_Vector_T)
     return not null access Object_T'Class;

   pragma Precondition
     (Name /= ""
        and then Output_Directory /= "");

   pragma Postcondition
     (Create'Result.Get_Name = Name
        and then Create'Result.Get_Output_Directory = Output_Directory
        and then Create'Result.Number_Of_Packages = Integer (Package_List.Length));

   ----------------
   --  Get_Name  --
   ----------------

   not overriding
   function Get_Name
     (Self : in Object_T)
     return String;

   ----------------------------
   --  Get_Output_Directory  --
   ----------------------------

   not overriding
   function Get_Output_Directory
     (Self : in Object_T)
     return String;

   --------------------------
   --  Number_Of_Packages  --
   --------------------------

   not overriding
   function Number_Of_Packages
     (Self : in Object_T)
     return Natural;

   -------------------
   --  Get_Package  --
   -------------------

   not overriding
   function Get_Package
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Model.Package_Def.Object_T'Class;

   pragma Precondition
     (Index <= Self.Number_Of_Packages);

private

   type Object_T is tagged
   record
      Name             : String_Access_T := null;
      Output_Directory : String_Access_T := null;

      Owned_Packages : Package_Def_Vector_T
        := Package_Def_Vectors.Empty_Vector;
   end record;

end Model.Project;
