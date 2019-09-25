with Ada.Characters.Latin_1;
with Ada.Strings.Fixed;

with Model.Comment;
--  with Model.Dependency;
with Model.Element;
with Model.Named_Element;
--  with Model.Field;
--  with Model.Namespace;
--  with Model.Operation;
--  with Model.Package_Def;
--  with Model.Parameter;
--  with Model.Project;
--  with Model.Types.Class_Def;
--  with Model.Types.Interface_Def;
--  with Model.Parent_Project;

package body Model.Visitor.Printer is

   -----------------------------------------------------------------------------
   --
   --  local declarations
   --
   -----------------------------------------------------------------------------

   package U_Str renames Ada.Strings.Unbounded;

   subtype U_String is U_Str.Unbounded_String;
   use type U_String;

   package Latin_1 renames Ada.Characters.Latin_1;
   EOL : constant String := Latin_1.CR & Latin_1.LF;

   -----------------------------------------------------------------------------
   --
   --  public operations definitions
   --
   -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Class
   --    (Self   : in out Object_T;
   --     Object : in out Model.Types.Class_Def.Object_T'Class)
   --  is
   --  begin
   --    Self.Add ("class " & Object.Get_Name);

   --    if Object.Is_Abstract then
   --      Self.Add (" (abstract)");
   --    end if;

   --    Self.Add (EOL);

   --    --  Object.Get_Defined_Namespace.Visit (Self);
   --  end Visit_Class;

   -----------------------------------------------------------------------------

   overriding
   procedure Visit_Comment
     (Self   : in out Object_T;
      Object : in out Model.Comment.Object_T'Class)
   is
   begin
      Self.Add ("-- " & Object.Get_Text & EOL);
   end Visit_Comment;

   -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Dependency
   --    (Self   : in out Object_T;
   --     Object : in out Model.Dependency.Object_T'Class)
   --  is
   --  begin
   --    Self.Add ("dependency between" & EOL &
   --                " client : " & Object.Get_Client.Get_Name & EOL &
   --                " provider : " & Object.Get_Provider.Get_Name & EOL);
   --  end Visit_Dependency;

   -----------------------------------------------------------------------------

   overriding
   procedure Visit_Element
     (Self   : in out Object_T;
      Object : in out Model.Element.Object_T'Class)
   is
   begin
      Self.Add ("[element]");

      for J in 1 .. Object.Comment_Count loop
         Self.Add (EOL & "-- " & Object.Get_Comment (J).Get_Text);
      end loop;
   end Visit_Element;

   -----------------------------------------------------------------------------

   overriding
   procedure Visit_Named_Element
     (Self   : in out Object_T;
      Object : in out Model.Named_Element.Object_T'Class)
   is
   begin
      Self.Add ("[named_element]" & " " & Object.Get_Name & EOL);
      Self.Visit_Element (Object);
   end Visit_Named_Element;

   -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Field
   --    (Self   : in out Object_T;
   --     Object : in out Model.Field.Object_T'Class)
   --  is
   --  begin
   --    Self.Indent;
   --    Self.Add
   --      ("field " & Object.Get_Name & " : " & Object.Get_Type &
   --         (if Object.Has_Default_Value then
   --            " := " & Object.Get_Default_Value
   --          else "") &
   --         EOL);
   --  end Visit_Field;

   --  -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Interface
   --    (Self   : in out Object_T;
   --     Object : in out Model.Types.Interface_Def.Object_T'Class)
   --  is
   --  begin
   --    Self.Add
   --      ("interface " & Object.Get_Name);
   --  end Visit_Interface;

   --  -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Namespace
   --    (Self   : in out Object_T;
   --     Object : in out Model.Namespace.Object_T'Class)
   --  is
   --  begin
   --    Self.Add
   --      ("namespace " & Object.Get_Name & EOL);

   --    Self.Incr_Indent;

   --    --  for I in 1 .. Object.Member_Count loop
   --    --    Object.Get_Member (I).Visit (Self);
   --    --  end loop;

   --    Self.Decr_Indent;

   --  end Visit_Namespace;

   --  -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Operation
   --    (Self   : in out Object_T;
   --     Object : in out Model.Operation.Object_T'Class)
   --  is
   --  begin
   --    Self.Indent;
   --    Self.Add ("operation " & Object.Get_Name);

   --    if Object.Has_Return then
   --      Self.Add (" return " & Object.Get_Type);
   --    end if;

   --    Self.Add (EOL);

   --    Self.Incr_Indent;

   --    for I in 1 .. Object.Parameter_Count loop
   --      Self.Visit_Parameter (Object.Get_Parameter (I).all);
   --    end loop;

   --    Self.Decr_Indent;
   --  end Visit_Operation;

   --  -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Package
   --    (Self   : in out Object_T;
   --     Object : in out Model.Package_Def.Object_T'Class)
   --  is
   --  begin
   --    Self.Indent;
   --    Self.Add ("package " & Quote (Object.Get_Name) & EOL);

   --    declare
   --      Number     : constant Natural := Object.Owned_Element_Count;
   --      Number_Img : constant String  := Number'Img (2 .. Number'Img'Length);
   --      Child : Model.Element.Class_T;
   --    begin
   --      if Number > 0 then
   --        Self.Incr_Indent;
   --        Self.Add ( "elements (" & Number_Img & "):" & EOL );

   --        for I in 1 .. Number loop
   --          Child := Object.Get_Owned_Element (I);
   --          Child.Visit ( Self );
   --        end loop;

   --        Self.Decr_Indent;
   --      end if;
   --    end;
   --    --  for Child of Object.Get_Children loop
   --    --    Child.Visit (Self);
   --    --  end loop;
   --  end Visit_Package;

   -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Parameter
   --    (Self   : in out Object_T;
   --     Object : in out Model.Parameter.Object_T'Class)
   --  is
   --  begin
   --     Self.Indent;
   --     Self.Add
   --       ("parameter " & Object.Get_Name & " : "
   --          & Parameter.Direction_Img (Object.Get_Direction).all & " "
   --          & Object.Get_Type_Expression);
   --  end Visit_Parameter;

   -----------------------------------------------------------------------------

   --  overriding
   --  procedure Visit_Project
   --    (Self   : in out Object_T;
   --     Object : in out Model.Project.Object_T'Class)
   --  is
   --  begin
   --    if Object.Has_Parent then
   --      Self.Incr_Indent;
   --      Self.Add
   --        ("subproject " & Quote (Object.Get_Name) & EOL);
   --      Self.Add
   --        ( "parent: " & Quote (Object.Get_Parent.Get_Name) & EOL);
   --    else
   --      Self.Add
   --      ("project " & Quote (Object.Get_Name) & EOL);
   --    end if;

   --    declare
   --      Number     : constant Natural := Object.Subproject_Count;
   --      Number_Img : constant String  := Number'Img (2 .. Number'Img'Length);
   --      Child : Model.Element.Class_T;
   --    begin
   --      if Number > 0 then
   --        Self.Incr_Indent;
   --        Self.Add ( "children (" & Number_Img & "):" & EOL );

   --        for I in 1 .. Number loop
   --          Child := Object.Get_Subproject (I);
   --          Child.Visit ( Self );
   --        end loop;

   --        Self.Decr_Indent;
   --      end if;
   --    end;

   --    declare
   --      Number     : constant Natural := Object.Owned_Element_Count;
   --      Number_Img : constant String  := Number'Img (2 .. Number'Img'Length);
   --      Child : Model.Element.Class_T;
   --    begin
   --      if Number > 0 then
   --        Self.Incr_Indent;
   --        Self.Add ( "elements (" & Number_Img & "):" & EOL );

   --        for I in 1 .. Number loop
   --          Child := Object.Get_Owned_Element (I);
   --          Child.Visit ( Self );
   --        end loop;

   --        Self.Decr_Indent;
   --      end if;
   --    end;

   --    if Object.Has_Parent then
   --      Self.Decr_Indent;
   --    end if;
   --  end Visit_Project;

   -----------------------------------------------------------------------------

   function To_String
     (Self : in Object_T)
     return String
   is
   begin
      return U_Str.To_String (Self.Content);
   end To_String;

   -----------------------------------------------------------------------------
   --
   --  private operations definitions
   --
   -----------------------------------------------------------------------------

   not overriding
   procedure Add
     (Self : in out Object_T;
      Text : in     String)
   is
      Start : constant Integer := U_Str.Length (Self.Content) - EOL'Length + 1;
      Stop  : constant Integer := U_Str.Length (Self.Content);
      Last  : constant String  := (if Start < 0 then
                                      "" else
                                      U_Str.Slice (Self.Content, Start, Stop ));
   begin
      if Last = EOL then
         Self.Indent;
      end if;
      Self.Content := Self.Content & Text;
   end Add;

   -----------------------------------------------------------------------------

   not overriding
   procedure Indent
     (Self : in out Object_T)
   is
   begin
      Self.Content := Self.Content &
        Ada.Strings.Fixed."*" (Self.Current_Indent, ' ');
   end Indent;

   -----------------------------------------------------------------------------

   not overriding
   procedure Incr_Indent
     (Self : in out Object_T)
   is
   begin
      Self.Current_Indent := Self.Current_Indent + Self.Incr;
   end Incr_Indent;

   -----------------------------------------------------------------------------

   not overriding
   procedure Decr_Indent
     (Self : in out Object_T)
   is
   begin
      Self.Current_Indent := Self.Current_Indent - Self.Incr;
   end Decr_Indent;

   -----------------------------------------------------------------------------

   function Quote
     (Text : in String)
     return String
     is ( "'" & Text & "'" );

   -----------------------------------------------------------------------------

end Model.Visitor.Printer;
