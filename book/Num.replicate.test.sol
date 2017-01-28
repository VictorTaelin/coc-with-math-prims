a= (Num.replicate # 3 1)
b= (List.Cons # 1 (List.Cons # 1 (List.Cons # 1 (List.Nil #))))

(Id.the 
  (Equal (List #) a b)
  (Equal.refl (List #) a))
  
