With Ada.Text_IO; Use Ada.Text_IO;
With Ada.integer_text_io;
With Ada.Characters.Handling; Use Ada.Characters.Handling;
With Ada.Strings.Unbounded; Use Ada.Strings.Unbounded;
With Ada.Strings.Maps; Use Ada.Strings.Maps;
With Ada.Text_IO.Unbounded_IO; Use Ada.Text_IO.Unbounded_IO;
With Ada.Numerics.Discrete_Random;
With ada.io_exceptions;
With hangman; Use hangman;

Procedure hangmain is 

 
	--VARIABLES--
	WordList: List_Type;
	response  : character := 'y';
	guess     : character;
	MAXWRONG  : constant integer := 6;
	MAXCOR    : integer := 0;
	CorCount  : integer := 0;
	CorPrev   : integer:= 0;
	Wrongcount: integer:= 0;
	Wrongprev : integer := 0;
	totalcount: integer:= 0;
	CurrWord: Unbounded_String;
	GuessStack: SType(26);
	Type showWord is Array(Positive Range <>) of Character;
	DispWord  : showWord(1..100);
	CorrectWord: showWord(1..100);
	Man       : ManArray;
Begin 
	--- INITIALIZE GUESSES ---
	InitList(WordList);
	--WELCOME TO HANGMAN--
	Put("***** W E L C O M E  T O  H A N G M A N  *****");
	New_Line;
	Put(" By: Jon Hollan, Mark Hoffman, & Brandon Ball");
	New_Line;
	New_Line;
	
	while (response = 'y') OR (response = 'Y') loop
	    StackInit(GuessStack);
		CurrWord:= GetWord(WordList);
		MAXCOR:= Length(CurrWord);
		for i in 1..MAXCOR loop
			DispWord(i) := '-';
		end loop;
		
		for i in 1..MAXCOR loop
			CorrectWord(i):= Element(CurrWord, i);
		end loop;
		
		--- START THE ROUND ---		
		--while(CorCount /= MAXCOR) OR (WrongCount /= MAXWRONG) loop
		loop	
			Wrongprev:= Wrongcount;
			CorPrev  := CorCount;
			Man:= CreateMan(Wrongcount);
			DrawMan(Man);
			New_Line;
			for i in 1..MAXCOR loop
				Put(DispWord(i));
			End loop;
			New_Line;
			
			Put("Guesses: ");
			Print(GuessStack);			
			New_Line;
			Put("Enter Guess: ");
			get(guess);
			Push(GuessStack, guess);
		
			for i in 1..MAXCOR loop
				if (guess = CorrectWord(i)) Then
					DispWord(i) := CorrectWord(i);
					CorCount:= CorCount + 1;
				end if;
			end loop;
			
			if (CorCount = CorPrev) Then
				WrongCount := WrongCount + 1;
			end if;
			
			ShowMessage(Wrongcount, Wrongprev);
			New_Line;
			New_Line;
			exit when (CorCount = MAXCOR);
			exit when (WrongCount = MAXWRONG);
		end loop;
			if (Wrongcount = MAXWRONG) Then
				Man:= CreateMan(WrongCount);
				DrawMan(Man);
				Put("The correct word was ");
				Put(Item => CurrWord);
				New_Line;
				Put("Would you like to play again? y/n: ");
				Get(response);
			end if;
			
			if (CorCount = MAXCOR) Then
				Put("Congratulations! YOU WON!");
				New_Line;
				Put("The correct word was ");
				Put(Item => CurrWord);
				New_Line;
				Put("Would you like to play again? y/n: ");
				Get(response);
			end if;
			totalcount:= WrongCount + CorCount;
			WrongCount:= 0;
			CorCount := 0;
			
			
	end loop;
end hangmain;
