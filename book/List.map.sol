u: *          
v: *          

f: -u v       
l: (List u)   

List: *       
cons: -v -List List
nil: List
(l List (h:u (cons (f h))) nil)
