S= Nat.Succ
Z= Nat.Zero

(Id.the (Vector Nat (S (S (S Z))))
  (Vector.Cons Nat (S (S Z)) Z
  (Vector.Cons Nat    (S Z)  Z
  (Vector.Cons Nat       Z   Z
  (Vector.Nil Nat Z)))))
