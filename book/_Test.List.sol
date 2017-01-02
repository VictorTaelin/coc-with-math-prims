S= Nat.Succ
Z= Nat.Zero
N= (List.Nil Nat)
C= (List.Cons Nat)

(List.map Nat Nat
  (Nat.mul (S (S (S Z))))
  (C (S (S Z)) (C (S Z) (C Z N))))
