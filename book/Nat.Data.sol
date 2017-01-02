( Data.Spec
  ( ( Data.Ctor.Append (Data.Field.Append (Data:* Nat:Data Nat) Data.Field.End))
    ( Data.Ctor.Append Data.Field.End Data.Ctor.End)))

Same as this:

D: *
A: *
M: *
data: -A D
add: -M -A A
zer: A
mul: -(-D D) -M M
one: M
(data 
  (add (mul (nat:D nat) one) 
  (add one zer)))

What is better?
Maybe the former with shorter names?
Implement name aliases?

"call Data.Ctor.Append Ca"
