dt: Data
(dt * (-* *) (-* *)
(DT:(-* *) T-* (DT T))
(CT:(-* *) E:(-* *) T:* (C-(CT T) (E T)))
(T:* T)
(FT:(-* *) E:(-* *) T:* (C-(FT T) (E T)))
(T:* T))





(dt: Data
(dt
*
(-* *)
(-* *)
(DT:(-* *) T-* (DT T))
(CT:(-* *) E:(-* *) T:* (C- (CT T) (E T)))
(T:* T)
(FT:(-* *) E:* T:* (C-(FT *) E))
*
) Nat.Data)


D: *
A: *
M: *
data: -A D
add: -M -A A
zer: A
mul: (-D D) -M M
one: M
(data 
  (add (mul (nat:D nat) one) 
  (add one
       zer)))


Nat-*
Succ- -Nat Nat
Zero- Nat
Nat




(dt: Data
(dt
(-* *)
(-* *)
(-* *)
(DT:(-* *) T:* (DT T))
(CT:(-* *) E:(-* *) T:* (C- (CT T) (E T)))
(T:* T)
(FT:(-(-* *) -* *) E:(-* *) T:* (C-(FT (x:* x) T) (E T)))
(T:* T)
))
