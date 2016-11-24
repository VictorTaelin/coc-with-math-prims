(
S: -Nat Nat
Z: Nat

  (Id.the (Vec Nat (S (S (S Z))))
    (Vec.Cons Nat (S (S Z)) Z
    (Vec.Cons Nat    (S Z)  Z
    (Vec.Cons Nat       Z   Z
    (Vec.Nil Nat Z)))))

Nat.Succ
Nat.Zero
)

