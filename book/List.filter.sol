u: *          

f: -u Bool       
l: (List u)   

List: *       
cons: -u -List List
nil: List

(l List (h:u t:List (f h List (cons h t) t)) nil)
