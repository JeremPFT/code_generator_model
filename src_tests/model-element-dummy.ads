with Model.Element;

package Model.Element.Dummy is

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   package Parent_Pkg renames Model.Element;
   subtype Parent_T is Parent_Pkg.Object_T;

   type Object_T is new Model.Element.Object_T with null record;

   type Dummy_Class_T is access all Object_T'Class;

   type Dummy_Array_T is
   array (Positive range <>) of not null access constant Object_T'Class;

   -----------------------------------------------------------------------------
   --  initilization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
   (Self : in out Object_T);

   --------------
   --  Create  --
   --------------

   function Create
   return not null access Object_T'Class;

end Model.Element.Dummy;
