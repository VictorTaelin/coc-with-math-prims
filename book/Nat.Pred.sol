n:Nat

(n (-Bool Nat)

  ( pred: (-Bool Nat)
    firstCase: Bool 
    (firstCase Nat 
      (pred Bool.False)
      (Nat.Succ (pred Bool.False))))

  ( firstCase: Bool
    (firstCase Nat
      Nat.Zero
      Nat.Zero))
      
  Bool.True)
