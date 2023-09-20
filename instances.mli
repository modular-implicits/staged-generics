open Imp.Any
open Classes

implicit module Pair {A: Any} {B: Any}
:  Product
  with type t = A.t * B.t
  and type a = A.t
  and type b = B.t

implicit module Option {A: Any}
: Sum
  with type t = A.t option
  and type a = A.t
  and type b = unit

implicit module List {A: Any}
: Sum
  with type t = A.t list
  and type a = unit
  and type b = A.t * A.t list

implicit module Unit
: Unit
  with type t = unit
