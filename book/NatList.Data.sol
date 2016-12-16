D: *
A: *
M: *
data: -A D
add: -M -A A
zer: A
mul: -(-D D) -M M
one: M
(data 
  (add
    (mul (list:D 
      (data 
        (add (mul (nat:D nat) one)
        (add one zer))))
    (mul (list:D list) one))
  (add one zer)))
