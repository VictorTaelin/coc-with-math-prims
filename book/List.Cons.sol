t: *

head: t
tail: (List t)

List: *
Cons: -t -List List
Nil: List

(Cons head (tail List Cons Nil))
