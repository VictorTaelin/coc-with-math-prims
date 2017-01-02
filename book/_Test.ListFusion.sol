S= Nat.Succ
Z= Nat.Zero
N= (List.Nil Nat)
C= (List.Cons Nat)

(l:(List Nat)
  (List.filter Nat Nat.isZero
    (List.zipWith Nat Nat Nat Nat.add
      (List.map Nat Nat (Nat.add (S Z)) l)
      (List.map Nat Nat (Nat.add (S Z)) l))))
