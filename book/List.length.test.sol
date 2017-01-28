a= (List.Cons Nat Nat.Zero
   (List.Cons Nat Nat.Zero 
   (List.Cons Nat Nat.Zero 
   (List.Nil Nat))))
   
b= (Nat.Succ
   (Nat.Succ
   (Nat.Succ
   Nat.Zero)))

(Id.the
  (Equal Nat (List.length Nat a) b)
  (Equal.refl Nat b))

