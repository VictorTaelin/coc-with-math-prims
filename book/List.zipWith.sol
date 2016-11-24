u: *
f: -u -u u
a: (List u)
b: (List u)
List: *
cons: -u -List List
nil: List
(B:*
  (a (- B List)
    (h:u t:(- B List) k:B (k t h))
    (k:B nil)
  (b B
    (x:u t:B k:(-B List) y:u (cons (f x y) (k t)))
    (k:(-B List) x:u nil)))
  r@(-(-r List) (-u List)))

TODO: make this work for lists of different types
