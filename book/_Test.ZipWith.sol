S= Nat.Succ
Z= Nat.Zero
N= (List.Nil Nat)
C= (List.Cons Nat)

(List.zipWith Nat Nat Nat
  Nat.add
  (C Z (C (S Z) (C (S (S Z)) N)))
  (C Z (C (S Z) (C (S (S Z)) N))))
