a= (List.replicate Nat (Nat.Succ (Nat.Succ (Nat.Succ Nat.Zero))) Nat.Zero)
b= (List.Cons Nat Nat.Zero
   (List.Cons Nat Nat.Zero
   (List.Cons Nat Nat.Zero
   (List.Nil Nat))))

(Id.the
  (Equal (List Nat) a b)
  (Equal.refl (List Nat) a))




t: *

n: Nat
x: t

List: *
Cons: -t -List List
Nil: List

(n List (Cons x) Nil)
