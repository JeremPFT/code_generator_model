with Model.Types.Named_Element; use Model.Types.Named_Element;

package body Model.Named_Element.Dummy is

   --------------
   --  Create  --
   --------------

   function Create
     (Name : in String := "")
     return not null access Object_T'Class
   is
      Object : constant Named_Element_Class_T := new Object_T;
   begin
      Object.Initialize (Name => Name);
      return Dummy_Class_T (Object);
   end Create;

end Model.Named_Element.Dummy;
