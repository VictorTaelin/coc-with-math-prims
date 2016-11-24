a: Nat
b: Nat
Nat: *
succ: (-Nat Nat)
zero: Nat
(A:* ((a (-A Nat) (p:(- A Nat) k:A (k p)) (k:A zero))
      (b (-A Nat) (p:(- A Nat) k:A (succ (k p))) (k:A zero)))
      r@(- r Nat))
