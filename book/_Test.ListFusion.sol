(
S: -Nat Nat
Z: Nat
N: (List Nat)
C: -Nat -(List Nat) (List Nat)

(l:(List Nat)
  (List.filter Nat Nat.isZero
    (List.zipWith Nat Nat Nat Nat.add
      (List.map Nat Nat (Nat.add (S Z)) l)
      (List.map Nat Nat (Nat.add (S Z)) l))))

Nat.Succ
Nat.Zero
(List.Nil Nat)
(List.Cons Nat)
)

