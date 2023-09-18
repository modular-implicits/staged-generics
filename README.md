# staged-generics
This library defines and instantiates a set of typeclasses 
(using [modular implicits](https://github.com/ocamllabs/ocaml-modular-implicits))
to allow generic programming over arbitrary data types.

It also uses [BER MetaOCaml](https://okmij.org/ftp/meta-programming/ber-design.pdf)
to allow efficient code to be derived, without the performance overhead of converting to and from a separate representation.

This has a similar aim to the paper [Staged Generic Programming](https://dl.acm.org/doi/pdf/10.1145/3110273) by Jeremy Yallop,
but for a different kind of generic programming.

The [compact](https://github.com/modular-implicits/compact) library provides a nice example use-case of this library.
It derives trivial binary encodings for arbitrary (finite) data types.
