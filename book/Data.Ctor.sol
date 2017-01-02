Ctor-*

Append- -Data.Field -Ctor Ctor
End- Ctor

Ctor

field: Field
rest: ...








77

data Tree = Bin Tree Tree | Tip

(Data.Start
  (Data.Ctor (Data.Field (s:Data s) (Data.Field (s:Data s) Data.End))
  (Data.Ctor Data.End)
  Data.Stop))



  

(Data.Data
  (Data.Ctor 
    (Data.Field (s:Data Num) Data.EndField)
    (Data.Field (s:Data Num) Data.EndField)
    Data.EndCtor))

(Data.Data
  (Data.Ctor Data.
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

