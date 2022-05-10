With Ada.Text_IO; Use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
With Ada.Characters.Handling; Use Ada.Characters.Handling;
With Ada.Strings.Unbounded; Use Ada.Strings.Unbounded;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
with ada.integer_text_io;
use ada.integer_text_io;
With Ada.Numerics.Discrete_Random;
Package body hangman is
Package random_num is new Ada.Numerics.Discrete_Random (Result_subtype => rng);

    Procedure StackInit (Stk: in out SType) is
    begin
        Stk.Top := 0;
    end StackInit;
    

Function StkTop (Stk: in SType) return Character is 
   Begin
	Return Stk.Store(Stk.Top);
End StkTop;

Procedure Push (Stk : in out SType; new_e : in Character) is
    Begin
		if Stk.Top /= Stk.Size then
			Stk.Top := Stk.Top + 1;
			Stk.Store (Stk.Top) := new_e;
        End if;
End Push;

Procedure Pop (Stk: in out SType) is
    Begin
		loop
			if Stk.Top /= 0 then
				
				Stk.Top := Stk.Top - 1;
			end if;
			exit when Stk.Top = 0;
		end loop;
	end Pop;
	
Procedure Print (Stk: in SType) is
    Begin
        for i in 1 .. Stk.top loop
	  put(item => Stk.Store(i));
	  put(item => "  ");
        end loop;
    end print;

	
------------ List Functions ---------------------------------

   procedure Search_Linked_List (List :  in List_Type;
                                 Key :  in Unbounded_String;
                                 Found : out Boolean;
                                 Pred_Loc : out Node_Ptr;
                                 Location : out Node_Ptr) is

   begin
      Location := List.Head;  -- Start at the beginning of the linked list
      Pred_Loc := null;  -- No predecessor for 1st element in the list
      -- Search the linked list
      -- Each iteration, check one node
      loop
         exit when Location = null or else -- Reached the end
                   Key < (Location.all.Info) or else -- Passed by
                   Key = (Location.all.Info);  -- Found it
         Pred_Loc := Location ;  
         Location := Location.all.Next;
      end loop; -- Found := Location /= null and then Key = Location.all.Info;
      if Location /= null then
         Found := Key = (Location.all.Info);
      else
         Found := False;
      end if;
   end Search_Linked_List;
   
----------------------------------------------------------------------------
  
   procedure Insert (List : in out List_Type;
                     Word : in Unbounded_String) is
      Have_Duplicate : Boolean;
      Pred_Loc : Node_Ptr;
      Location : Node_Ptr;
   begin
      Search_Linked_List (List => List,
                          Key => Word,
                          Found => Have_Duplicate,
                          Pred_Loc => Pred_Loc,
                          Location => Location);
      if Have_Duplicate then
         raise DUPLICATE_KEY;
      elsif Pred_Loc = null then
         -- Add Item to the head of the linked list
         List.Head := new Node_Type'(Info => Word, Next => List.Head);
      else -- Add at the middle or end of the linked list
         Pred_Loc.all.Next := new Node_Type'(Info => Word, Next => 
Location);
      end if;
   exception
      when STORAGE_ERROR => -- Overflow when no storage available
         raise OVERFLOW;
   end Insert;
   
   
----------------------------------------------------------------------------
   procedure Traverse(List : in out List_Type; RandomNum : in Integer;  Element : out Unbounded_String) is
      Location : Node_Ptr;  -- Designates current node
   begin
      Location := List.Head;  -- Start with the first node in the linked 
      for i in 1..RandomNum loop
         exit when Location = null;
         Element := Location.all.info;
         Location := Location.all.Next; -- Move to next node
      end loop;
   end Traverse;
  
--------------------------------------------------------------------------
Procedure InitList(x: out List_Type) is

subtype File_Type is Ada.Text_IO.File_Type; -- creates a subtype File_Type
File_1: File_Type;
Test_File : File_Type;
c : character;
line_data2 : Unbounded_String;
Begin
    Ada.Text_IO.Open(File => File_1, mode => Ada.Text_IO.IN_File, name => "wordbank.txt");
    While not Ada.Text_IO.End_of_File(File_1) loop
        loop
			Get(File => File_1, Item => c);
			exit when c = ' ';
			line_data2 := line_data2 & to_lower(c);
        end loop;
		Insert(x, line_data2);
        line_data2 := to_unbounded_string("");
    end loop;
    Ada.Text_IO.Close(File => File_1);
End InitList;


Function RandomNumber Return Integer is
R: random_num.Generator;

Begin
    random_num.Reset (Gen => R);
    Return random_num.random(Gen => R);
End RandomNumber;


Function GetWord (x: In List_Type) Return Unbounded_String is
	randnum: integer;
	retword: Unbounded_String;
        retrieve : List_Type := x;
Begin 
	randnum:= RandomNumber;
	Traverse(retrieve, randnum, retword);
	Return retword;
End GetWord;


------------ Game Functions ---------------------------------
Function CreateMan (WrongCount: integer) Return ManArray is 
	HangMan: ManArray;
	One: Line;
	Two: Line;
	Three: Line;
	Four: Line;
	Five: Line;
	Six: Line;
	Seven: Line;
	Eight: Line;
	Nine: Line;
	Ten: Line;
	Eleven: Line;
Begin 

	
	if (WrongCount = 0) Then 

		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |            *";
		Five  := "    |            *";
		Six   := "    |            *";
		Seven := "    |            *";
		Eight := "    |            *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
		
	elsif (WrongCount = 1) Then
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |      O     *";
		Five  := "    |            *";
		Six   := "    |            *";
		Seven := "    |            *";
		Eight := "    |            *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
		
	elsif (WrongCount = 2) Then
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |      O     *";
		Five  := "    |      |     *";
		Six   := "    |      |     *";
		Seven := "    |            *";
		Eight := "    |            *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
	
	elsif (WrongCount = 3) Then
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |    \ O     *";
		Five  := "    |     \|     *";
		Six   := "    |      |     *";
		Seven := "    |            *";
		Eight := "    |            *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
		
	elsif (WrongCount = 4) Then
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |    \ O /   *";
		Five  := "    |     \|/    *";
		Six   := "    |      |     *";
		Seven := "    |            *";
		Eight := "    |            *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
		
	elsif (WrongCount = 5) Then
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |    \ O /   *";
		Five  := "    |     \|/    *";
		Six   := "    |      |     *";
		Seven := "    |     /      *";
		Eight := "    |    /       *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
		
	elsif (WrongCount = 6) Then 
		One   := "******************";
		Two   := "     _ _ _ _     *";
		Three := "    |      |     *";
		Four  := "    |    \ O /   *";
		Five  := "    |     \|/    *";
		Six   := "    |      |     *";
		Seven := "    |     / \    *";
		Eight := "    |    /   \   *";
		Nine  := "    |            *";
		Ten   := " --------        *";
		Eleven:= "******************";
	
	end if;
	
	HangMan(1) := One;
	HangMan(2) := Two;
	HangMan(3) := Three;
	HangMan(4) := Four;
	HangMan(5) := Five;
	HangMan(6) := Six;
	HangMan(7) := Seven;
	HangMan(8) := Eight;
	HangMan(9) := Nine;
	HangMan(10) := Ten;
	HangMan(11) := Eleven;
	
	Return HangMan;

End CreateMan;
-----------------------------------------------------------------------------------------

Procedure DrawMan(Man: IN ManArray) is
Begin
	For i in 1..11 Loop
		Ada.Text_IO.Put(Item => Man(i));
		New_Line;
	End Loop;
End DrawMan;

-------------------------------------------------------------------------------------------

Procedure ShowMessage(WrongCount: integer; WrongPrev: integer) is

Begin
	if (WrongCount = WrongPrev) Then
		Put("Good Guess!");
	else 
		if (WrongCount = 1) Then 
			Put("Head added to Hang Man!");
		
		elsif (WrongCount = 2) Then 
			Put("Body added to Hang Man!");
		
		elsif (WrongCount = 3) Then
			Put("First arm added to Hang Man!");
		
		elsif (WrongCount = 4) Then
			Put("Second arm added to Hang Man!");
			
		elsif (WrongCount = 5) Then 
			Put("First leg added to Hang Man! Be Careful!!");
		
		else  -- (WrongCount = 6) Then
			Put("Second leg added to Hang Man!");
			New_Line;
			Put("You hung the man! YOU LOSE!");
			
		end if;
		
	end if;
  end ShowMessage;

  
-------------------------------------------------------------
end hangman;
