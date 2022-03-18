-- Listing 11: mutually_recursive_subprograms.adb

procedure Mutually_Recursive_Subprograms is

   procedure Compute_A (V : Natural);
   -- Forward declaration of Compute_A

   procedure Compute_B (V : Natural) is
   begin
      if V > 5 then
         Compute_A (V - 1);
         -- Call to Compute_A
      end if;
   end Compute_B;

   procedure Compute_A (V : Natural) is
   begin
      if V > 2 then
         Compute_B (V - 1);
         -- Call to Compute_B
      end if;
   end Compute_A;
begin
   Compute_A (15);
end Mutually_Recursive_Subprograms;
