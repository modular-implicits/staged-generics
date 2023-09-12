module type Product = sig
  (* type t = a * b *)
  type a
  type b
  type t
  val construct : a code -> b code -> t code
  val deconstruct : t code -> a code * b code
end

module type Sum = sig
  (* type t = a | b *)
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

module type Unit = sig
  type t
  val unit : t code
end

module type Wrapper = sig
  type t
  type inner
  val wrap : inner code -> t code
  val unwrap : t code -> inner code
end

module type Void = sig
  type t
  val absurd : t -> 'a
end
