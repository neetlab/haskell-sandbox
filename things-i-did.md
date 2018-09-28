# NOTE: Things that I did to build code w/ Haskell
## Installing
### Haskell binary
I've installed 64-bit full package for macOS from official dowonload page [^1]

it seems to contain several useful tools such as `stack` and `cabal`.

### Managing dependencies with Cabal
Cabal is a one of common package manager for a Haskell project

> NOTE: Technically, Cabal doesn't manage packages. It only builds contents of Haskell but Cabal-install which is one of pre-installed Cabal tool does.

Using `cabal install` to add a dependency to your project.

```
cabal install <PACKAGE NAME>
```

i've installed following packages to make productivity better:


<!-- REFERENCIES -->
[^1]: https://www.haskell.org/platform/mac.html

