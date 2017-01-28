n: Nat
(ThereIs.ex 
  (List Nat)
  (l: (List Nat) (Equal Nat (List.length Nat l) (Nat.self n)))

  (List.replicate Nat n Nat.Zero)
  (Equal.refl Nat (Nat.self n)))
