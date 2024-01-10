task body Producer is
begin
  for I in 1..1_000_000 loop
    Buffer.Put (I);
  end loop;
end Producer;
