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
