t: *
u: *
v: *
f: -t -u v
a: (List t)
b: (List u)
List: *
cons: -v -List List
nil: List
(B:*
  (a (- B List)
    (x:t xs:(- B List) k:B (k xs x))
    (k:B nil)
  (b B
    (y:u xs:B k:(-B List) x:t (cons (f x y) (k xs)))
    (k:(-B List) x:t nil)))
  r@(-(-r List) (-t List)))
