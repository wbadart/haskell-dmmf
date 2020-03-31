# haskell-dmmf

[![Haskell CI][badge]][ci]

Haskell implementation of Wlashin's [Domain Modeling Made
Functional][book]

In the book, author [Scott Wlashin][fsharp] makes a series of
compelling arguments for 1) the value of domain-driven design (DDD)
and 2) the effectiveness of functional programming techniques for
realizing DDD. In particular, he shows how algebraic types can
document the concepts of a domain and the relations between them and,
critically, that this "compilable spec" is also readable by
(non-technical) domain experts.

I for one was sold on the idea, so I sought practice. As a Haskeller,
the obvious first step was transcribing the case study in the book
from F# to Haskell. The repo is my attempt to do so.

## Differences from the Book

I'm writing this before really diving in, so I'm sure there will be
future divergence, but so far this is the only one I really have
planned:

- Use applicative validation, rather than the `Result` (F#)/ `Either`
  (Haskell) monad for smart constructors

## Setup

Just make sure you've got a decently modern version of
[`stack`][stack] and you should be able to run:

```shell
$ stack build
```


[badge]: https://github.com/wbadart/haskell-dmmf/workflows/Haskell%20CI/badge.svg
[ci]: https://github.com/wbadart/haskell-dmmf/actions
[book]: https://fsharpforfunandprofit.com/books/#domain-modeling-made-functional-ebook-and-paper
[fsharp]: https://fsharpforfunandprofit.com
[stack]: https://docs.haskellstack.org/en/stable/README/
