# Contributing

If you're reading this, thank you! Very glad you're interested in
contributing to this project. Below is pretty much just a writeup of
my personal workflow, and my own expectations of the code I'm
checking in to this repo (I'll have the same expectations of any PRs
that come my way, which are welcome!).

## Setup

As mentioned in the README, I'm using [`stack`][stack] to do most of
the heavy lifting in the build department. Simply cloning the repo
and running `stack build` (assuming you have `stack` installed; see
linked docs) should be enough to get you in business with the right
version of GHC and whatever dependencies I accrue over the course of
development:

```shell
$ git clone https://github.com/wbadart/haskell-dmmf.git  # or your fork
$ cd haskell-dmmf && stack build
```

## Code Format

I'm going to start things out by trying the [`brittany`][brit]
formatter with the default settings. All code that gets checked into
`master` should conform to this style. I'm going to look at
setting up some [pre-commit hooks][pre-commit] to make it easier to
slot this into the workflow.

## Testing

Just for fun, I clicked around the [Actions][actions] and saw there's
some basic out-of-the-box support for Haskell. I'm going to try using
that for automated testing. Any code that gets merged into `master`
should pass these tests.


[stack]: https://docs.haskellstack.org
[brit]: https://github.com/lspitzner/brittany
[pre-commit]: https://pre-commit.com
[actions]: https://github.com/wbadart/haskell-dmmf/actions
