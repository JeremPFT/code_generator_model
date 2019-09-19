with Model.Types.Project; use Model.Types.Project;

package body Model.Project is

   ------------------
   --  Initialize  --
   ------------------

   not overriding
   procedure Initialize
     (Self             : in out Object_T;
      Name             : in String;
      Output_Directory : in String;
      Package_List     : in Package_Def_Vector_T)
   is
   begin
      if (Name = "") then
         raise Constraint_Error with "name can't be empty";
      end if;

      if (Output_Directory = "") then
         raise Constraint_Error with "output directory can't be empty";
      end if;

      Self.Name := new String'(Name);
      Self.Output_Directory := new String'(Output_Directory);

   Fill_Packages:
      for Item of Package_List loop
         Self.Owned_Packages.Append (Item);
      end loop Fill_Packages;
   end Initialize;

   --------------
   --  Create  --
   --------------

   function Create
     (Name             : in String;
      Output_Directory : in String;
      Package_List     : in Package_Def_Vector_T)
     return not null access Object_T'Class
   is
      Result : constant Project_Class_T := new Object_T;
   begin
      Result.Initialize (Name             => Name,
                         Output_Directory => Output_Directory,
                         Package_List     => Package_List);
      return Result;
   end Create;

   ----------------
   --  Get_Name  --
   ----------------

   not overriding
   function Get_Name
     (Self : in Object_T)
     return String
     is (if Self.Name /= null
         then Self.Name.all
         else "");

   ----------------------------
   --  Get_Output_Directory  --
   ----------------------------

   not overriding
   function Get_Output_Directory
     (Self : in Object_T)
     return String
     is (if Self.Output_Directory /= null
         then Self.Output_Directory.all
         else "");

   --------------------------
   --  Number_Of_Packages  --
   --------------------------

   not overriding
   function Number_Of_Packages
     (Self : in Object_T)
     return Natural
     is (Natural (Self.Owned_Packages.Length));

   -------------------
   --  Get_Package  --
   -------------------

   not overriding
   function Get_Package
     (Self  : in Object_T;
      Index : in Positive)
     return not null access Model.Package_Def.Object_T'Class
   is
   begin
      if Index > Self.Number_Of_Packages then
         raise Out_Of_Bound;
      end if;

      return Self.Owned_Packages (Index);
   end Get_Package;

end Model.Project;
