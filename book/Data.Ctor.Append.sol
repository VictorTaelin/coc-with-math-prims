field: Data.Field
rest: Data.Ctor

Ctor: *

Append: -Data.Field -Ctor Ctor
End: Ctor

(Append field (rest Ctor Append End))
