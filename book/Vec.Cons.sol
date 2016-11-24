t: *
n: Nat

head: t
tail: (Vec t n)

Vec: -Nat *
Cons: n-Nat -t -(Vec n) (Vec (Nat.Succ n))
Nil: (Vec Nat.Zero) 

(Cons n head (tail Vec Cons Nil)) 
