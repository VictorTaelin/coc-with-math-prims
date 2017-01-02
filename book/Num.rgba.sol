r: Num
g: Num
b: Num
a: Num

(Num.add (Num.shiftl 24 r)
(Num.add (Num.shiftl 16 g)
(Num.add (Num.shiftl 8 b)
         a)))
