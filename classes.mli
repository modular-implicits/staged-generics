(** Represents the algebraic product of two data types, such as a tuple *)
module type Product = sig
  (** type t = a * b *)
  type a
  type b
  type t
  val construct : a code -> b code -> t code
  val deconstruct : t code -> a code * b code
end

(** Represents the algebraic sum of two data types *)
module type Sum = sig
  (** type t = a | b *)
  type a
  type b
  type t
  val construct_a : a code -> t code
  val construct_b : b code -> t code
  val match_ :
    (a code -> 'r code) ->
    (b code -> 'r code) ->
    t code -> 'r code
end

(** Represents types with exactly one value, such as unit *)
module type Unit = sig
  type t
  val unit : t code
end

(** Represents types which are an opaque wrapper around another type.
    Instances should only be in implicit scope if you want to allow generic implementation
    of classes that the wrapped type also implements.
    I.e., if you want the wrapper to remain opaque, don't make instances of this available.
 *)
module type Wrapper = sig
  type t
  type inner
  val wrap : inner code -> t code
  val unwrap : t code -> inner code
end

(** Represents types which have no values, such as Core.never_returns *)
module type Void = sig
  type t
  val absurd : t -> 'a
end
