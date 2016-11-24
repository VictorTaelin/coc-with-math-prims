(
S: -Nat Nat
Z: Nat
N: (List Nat)
C: -Nat -(List Nat) (List Nat)

(List.map Nat Nat
  (Nat.mul (S (S (S Z))))
  (C (S (S Z)) (C (S Z) (C Z N))))

Nat.Succ
Nat.Zero
(List.Nil Nat)
(List.Cons Nat)
)
