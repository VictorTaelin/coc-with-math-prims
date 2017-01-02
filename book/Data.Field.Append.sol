hole: Data-* -Data Data
rest: Data.Field

Field: *

Append: -(Data-* -Data Data) -Field Field
End: Field

(Append hole (rest Field Append End))
