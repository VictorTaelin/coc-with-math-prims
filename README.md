## Sol

Sol is both a *lightweight code-interchange format*, and a *functional programming language* based on the Calculus of Constructions.

- It is a port of [Haskell-Morte-Library](https://github.com/Gabriel439/Haskell-Morte-Library), with addition of Fix, floating-point primitives, a lighter syntax and a [substitution-free typechecker](https://github.com/AndrasKovacs/tcbe).

- The core is implemented as a ~200 LOC, dependency-free JS file (`sol.js`).

- It also includes a fast parser/serializer, an [observable-based runtime](https://github.com/MaiaVictor/PureState) and a compiler to/from native functions, making use of JS's JIT engines to achieve good performances.

- I'll be using it as both an experiment lab to explore/learn dependent types, and as a minimal runtime to validate the proposal of writing actual programs with a small core language.
