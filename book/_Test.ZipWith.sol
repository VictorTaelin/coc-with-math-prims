(
S: -Nat Nat
Z: Nat
N: (List Nat)
C: -Nat -(List Nat) (List Nat)

(List.zipWith Nat Nat Nat
  Nat.add
  (C Z (C (S Z) (C (S (S Z)) N)))
  (C Z (C (S Z) (C (S (S Z)) N))))

Nat.Succ
Nat.Zero
(List.Nil Nat)
(List.Cons Nat)
)

