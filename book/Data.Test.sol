7070

( ctor: Data.Ctor
     
  D: *
  A: *
  M: *
  data: -A D
  add: -M -A A
  zer: A
  mul: -(-D D) -M M
  one: M

  (data
    ( ctor
      A
      ( field: Data.Field
        fields: A
        ( add 
          ( field
            M
            ( next: Data-* -Data Data
              rest: M
              (mul (self:D (next D self)) rest))
          one)
        fields))
      zer)))

  ( ( Data.Ctor.Append (Data.Field.Append (Data:* Nat:Data Nat) Data.Field.End))
    ( Data.Ctor.Append Data.Field.End Data.Ctor.End))))


Ctor-*
Append- -Data.Field -Ctor Ctor
End- Ctor
Ctor


 (Data.Start
  (Data.Ctor (Data.Field (Nat:Data Nat) Data.End)
  (Data.Ctor Data.End)
  Data.Stop)))

a:*
b:(-Data.Field (-a a))
a:a
(b 
  (a:*
   b:(-(-Data Data) (-a a))
   a:a
   (b (a:Data a) a))
  (b Data.Field.End a))

(-(-Data.Field -Data Data) -Data Data)
