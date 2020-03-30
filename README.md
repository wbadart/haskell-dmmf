# haskell-dmmf

Haskell implementation of Wlashin's [Domain Modeling Made
Functional][book]

[book]: https://fsharpforfunandprofit.com/books/#domain-modeling-made-functional-ebook-and-paper

I just got done reading Domain Modeling Made Functional, by Scott
Wlashin of [fsharpforfunandprofit.com][fsharp] fame. It was a great
introduction to Domain-Driven Design (DDD) which I think expertly
made its argument that functional programming techniques mesh
seamlessly with DDD. I thought I'd try my hand at translating some of
his F# code to Haskell. I'm mostly going for a 1-1 transcription; the
one twist I'll add is that I'll take this opportunity to play around
with some applicative validation (he notes this approach in the book,
sticks to the F# `Result` monad for simplicity).

[fsharp]: https://fsharpforfunandprofit.com

## Setup

Just make sure you've got a decently modern version of
[`stack`][stack] and you should be able to run:

```shell
$ stack build
```

[stack]: https://docs.haskellstack.org/en/stable/README/
