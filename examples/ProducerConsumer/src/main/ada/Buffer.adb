task body Buffer is
  type Index is range 0..100;
  Data : array (Index range 1..Index'last) of Integer;
  Size : Index := 0; In_P, Out_P : Index := 1;
begin
  loop
    select
      when size < Index'last =>
        accept Put (C : Integer) do
          In_P := In_P mod Index'last + 1; Size := Size + 1;
          Data (In_P) := C;
        end Put;
    or
      when size > 0 =>
        accept Get (C : out Integer) do
          Out_P := Out_P mod Index'last + 1; Size := Size -1;
          C := Data (Out_P);
        end Get;
    end select;
  end loop;
end Buffer;
