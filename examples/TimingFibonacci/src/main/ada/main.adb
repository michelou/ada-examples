with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Text_Io; use Ada.Text_Io;

procedure main is

    function fibonacci(n : in integer) return integer is
    begin 
        if n = 0 then
            return 0;
        elsif n = 1 then
            return 1;
        else
            return fibonacci(n-1) + fibonacci(n-2);
        end if;
    end fibonacci;

    n : integer;
    startTime, endTime : Time;
    milliS : Duration;
    result : integer;

begin
    put_line("Fibonacci number: ");
    get(n);
    startTime := Clock;
    result := fibonacci(n);
    endTime := Clock;
    milliS := (endTime - startTime) * 1000;

    put_line("Result: " & Integer'Image(result));
    put_line("Execution time = " & Duration'Image(milliS) & " milliseconds.");
 
end main;
