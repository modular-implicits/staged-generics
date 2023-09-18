open Imp.Any
open Classes

implicit module Pair {A: Any} {B: Any}
:  Product
  with type t = A.t * B.t
  and type a = A.t
  and type b = B.t
= struct
  type t = A.t * B.t
  type a = A.t
  type b = B.t
  let construct a b = .< .~a, .~b >.
  let deconstruct p = .< fst .~p >., .< snd .~p >.
end

implicit module Option {A: Any}
: Sum
  with type t = A.t option
  and type a = A.t
  and type b = unit
= struct
  type t = A.t option
  type a = A.t
  type b = unit
  let construct_a a = .< Some .~a >.
  let construct_b _ = .< None >.
  let match_ fa fb x = .<
    match .~x with
    | Some a -> .~(fa .< a >.)
    | None -> .~(fb .< () >.)
  >.
end

implicit module List {A: Any}
: Sum
  with type t = A.t list
  and type a = unit
  and type b = A.t * A.t list
= struct
  type t = A.t list
  type a = unit
  type b = A.t * A.t list
  let construct_a _ = .< [] >.
  let construct_b p = .< let (x, xs) = .~p in x :: xs >.
  let match_ fa fb (x: A.t list code) = .<
    match .~x with
    | [] -> .~(fa .< () >.)
    | x :: xs -> .~(fb .< (x, xs) >.)
  >.
end

implicit module Unit
: Unit
  with type t = unit
= struct
  type t = unit
  let unit = .< () >.
end
