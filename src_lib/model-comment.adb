with Ada.Strings.Maps;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with Model.Types.Comment; use Model.Types.Comment;

package body Model.Comment is

   ------------------
   --  Initialize  --
   ------------------

   procedure Initialize
   (Self   : in out Object_T;
    Text   : in     String;
    Header : in     String := "";
    Footer : in     String := "";
    Prefix : in     String := "";
    Suffix : in     String := "")
   is
   begin
      Parent_T (Self).Initialize;

      Self.Text   := new String'(Text);
      Self.Header := new String'(Header);
      Self.Footer := new String'(Footer);
      Self.Prefix := new String'(Prefix);
      Self.Suffix := new String'(Suffix);
   end Initialize;

   --------------
   --  Create  --
   --------------

   function Create
   (Text   : in String;
    Header : in String := "";
    Footer : in String := "";
    Prefix : in String := "";
    Suffix : in String := "")
   return not null access Object_T'Class
   is
      Result : constant Comment_Class_T := new Object_T;
   begin
      Result.Initialize (Text   => Text,
                         Header => Header,
                         Footer => Footer,
                         Prefix => Prefix,
                         Suffix => Suffix);
      return Result;
   end Create;

   -----------------------------------------------------------------------------
   --  queries
   -----------------------------------------------------------------------------

   ----------------
   --  Get_Text  --
   ----------------

   not overriding
   function Get_Text
   (Self : in Object_T)
   return String
   is (if Self.Text = null then
          ""
       else
          Self.Text.all);

   --------------------------
   --  Get_Formatted_Text  --
   --------------------------

   not overriding
   function Get_Formatted_Text
   (Self : in Object_T)
   return String
   is
      package Maps renames Ada.Strings.Maps;
      package Strings renames Ada.Strings;
      package Str_F renames Ada.Strings.Fixed;
      package Str_U renames Ada.Strings.Unbounded;

      function "&"
      (Left  : Str_U.Unbounded_String;
       Right : String) return Str_U.Unbounded_String
        renames Str_U."&";

      New_Lines_Set : constant Maps.Character_Set :=
      Maps.To_Set (Latin_1.CR & Latin_1.LF);

      Test : Strings.Membership renames Strings.Outside;

      Result_Unb : Str_U.Unbounded_String := Str_U.Null_Unbounded_String;

      First, Last : Natural := 0;
      From        : Natural := 1;

      Header : constant String :=
      (if Self.Header = null then "" else Self.Header.all);
      Footer : constant String :=
      (if Self.Footer = null then "" else Self.Footer.all);
      Prefix : constant String :=
      (if Self.Prefix = null then "" else Self.Prefix.all);
      Suffix : constant String :=
      (if Self.Suffix = null then "" else Self.Suffix.all);
      Text : constant String := Self.Get_Text;

   begin
      if Header /= "" then
         Result_Unb := Str_U.To_Unbounded_String (Header);
      end if;

      while From < Text'Length
      loop
         Str_F.Find_Token (Source => Text,
                           Set    => New_Lines_Set,
                           Test   => Test,
                           From   => From,
                           First  => First,
                           Last   => Last);
         exit when Last < First;

         From := Last + 1;

         declare
            Subtext : constant String := Text (First .. Last);
         begin
            Result_Unb := Result_Unb
            & Prefix
            & Subtext
            & Suffix;
         end;

         if Last /= Text'Length then
            Result_Unb := Result_Unb & EOL;
         end if;
      end loop;

      if Footer /= "" then
         Result_Unb := Result_Unb & Footer;
      end if;

      return Str_U.To_String (Result_Unb);
   end Get_Formatted_Text;

   -----------------
   --  Annotates  --
   -----------------

   not overriding
   procedure Annotates
   (Self    : in out          Object_T;
    Element : not null access constant Model.Element.Object_T'Class)
   is
   begin
      Self.Annotated_Elements.Append (Element);
   end Annotates;

   --  -------------
   --  --  Visit  --
   --  -------------

   --  procedure Visit
   --    (Self   : in out Object_T;
   --     Object : in out Visitor.Object_T'Class)
   --  is
   --  begin
   --     Object.Visit_Comment (Self);
   --  end Visit;

end Model.Comment;
