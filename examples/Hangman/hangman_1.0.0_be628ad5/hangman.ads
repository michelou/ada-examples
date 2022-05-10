with ada.strings.unbounded;
use ada.strings.unbounded;
package hangman is
Subtype Line is String(1..18);
Type ManArray is Array (1..11) of Line;
Type alpha is Array (Positive range <>) of Character;
Type SArray is Array (Positive range <>) of Character;
Type SType (Size: Positive) is	record
	Top : Natural := 0;
    Store : SArray (1..Size);
End record;
DUPLICATE_KEY : exception;
KEY_ERROR : exception;
OVERFLOW : exception;
subtype rng is positive range 1 .. 100;
type List_Type is private;




	
------------STACK FUNCTIONS----------------	
Procedure StackInit (Stk: in out SType);
Function StkTop (Stk: in SType) return Character;
Procedure Push (Stk : in out SType; new_e : in Character);
Procedure Pop (Stk: in out SType);
procedure Print (Stk: in SType);

-------------LIST FUNCTIONS----------------
Procedure InitList(x: out List_Type);
Function RandomNumber Return Integer;
Function GetWord (x: In List_Type) Return Unbounded_String;

--------------GAME FUNCTIONS----------------
Function CreateMan (WrongCount: integer) Return ManArray;
Procedure DrawMan(Man: IN ManArray);
Procedure ShowMessage(WrongCount: integer; WrongPrev: integer);

   
---------------------------------------------------------------------------- 
   procedure Insert (List : in out List_Type; Word : in Unbounded_String);
   -- Purpose : Adds Item to List.
   -- Preconditions : None
   -- Postconditions : List = original list + Item
   -- Exceptions : OVERFLOW If there is no room for Item.
   -- List is unchanged.
   -- DUPLICATE_KEY If an element already exists in the list
   -- with the same key as Item.
   -- List is unchanged.
 
------------------------------------------------------------------------------- 
-- Iterator
   
----------------------------------------------------------------------------
   procedure Traverse
         (List : in out List_Type;
          RandomNum : in integer;
          Element : out Unbounded_String);
   -- Purpose : To process all the elements in List in ascending order
   -- Preconditions : Procedure Process does not change the key of an element
   -- Postconditions : Every element in List is passed to a call of
   -- procedure Process
   -- Elements processed in ascending order
  
--------------------------------------------------------------------------- 
private

   type Node_Type;
   type Node_Ptr is access Node_Type;
   type Node_Type is
      record
         Info : Unbounded_String;
         Next : Node_Ptr;
      end record;
   
   type List_Type is record
         Head : Node_Ptr;  -- Designates first node in the linked list
      end record;

end hangman;
