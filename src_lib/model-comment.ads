with Model.Element;
with Model.Types.Element; use Model.Types.Element;

package Model.Comment is

   --  A comment is a text owned by one or more elements.
   --
   --  A comment can be rendered using specific langage comment markup:
   --
   --  - ada:
   --    --  comment text line 1
   --    --  comment text line 2
   --    prefix is "--"
   --    suffix is ""
   --
   --  - java:
   --    /*
   --     * comment text line 1
   --     * comment text line 2
   --     */
   --    header is "/*\n"
   --    prefix is "*"
   --    suffix is ""
   --    footer is "*/"
   --
   --  - latex:
   --    \begin{comment}
   --    comment text line 1
   --    comment text line 2
   --    \end{comment}
   --    ...
   --
   --  Get_Text function returns raw text.
   --
   --  Get_Formatted_Text function returns text using header, footer, prefix,
   --  suffix.

   -----------------------------------------------------------------------------
   --  types
   -----------------------------------------------------------------------------

   type Object_T is new Model.Element.Object_T with private;

   -----------------------------------------------------------------------------
   --  initialization
   -----------------------------------------------------------------------------

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
     (Self   : in out Object_T'Class;
      Text   : in     String;
      Header : in     String := "";
      Footer : in     String := "";
      Prefix : in     String := "";
      Suffix : in     String := "");

   pragma Precondition
     (Text /= "");

   pragma Postcondition
     (Self.Get_Text = Text);

   --------------
   --  Create  --
   --------------

   function Create
     (Text   : in String;
      Header : in String := "";
      Footer : in String := "";
      Prefix : in String := "";
      Suffix : in String := "")
     return not null access Object_T'Class;

   pragma Precondition
     (Text /= "");

   pragma Postcondition
     (Create'Result.Get_Text = Text);

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   ----------------
   --  Get_Text  --
   ----------------

   not overriding
   function Get_Text
     (Self : in Object_T)
     return String;

   --------------------------
   --  Get_Formatted_Text  --
   --------------------------

   not overriding
   function Get_Formatted_Text
     (Self : in Object_T)
     return String;

   -----------------------------------------------------------------------------
   --  commands
   -----------------------------------------------------------------------------

   not overriding
   procedure Annotates
     (Self    : in out          Object_T;
      Element : not null access constant Model.Element.Object_T'Class);

   pragma Precondition
     (not Self.Is_Owned_By (Parent => Element));

   pragma Postcondition
     (Self.Is_Owned_By (Parent => Element));

private

   type Object_T is new Model.Element.Object_T
   with record
      Text   : String_Access := null;
      Header : String_Access := null;
      Footer : String_Access := null;
      Prefix : String_Access := null;
      Suffix : String_Access := null;

      Annotated_Elements : Element_Vector_T := Element_Vectors.Empty_Vector;
   end record;

end Model.Comment;
