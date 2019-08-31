Chapter 1
---------

- The lamda calculus has three components:
  expressions, variables, and abstractions
- Expressions include variables and abstractions
- Abstractions are functions
- Abstractions have two parts: head and body
- The head is a lambda symbol following by a variable name
- The body is an expression
- Example: \x.x (anonymous function)
- \x.x, \d.d, and \z.z are all the same function
- Beta reduction = apply a function to an argument
- Example: (\x.x) 2 = 2
- Eliminating the head tells you the function has been applied
- Another example: (\x.x)(\y.y) = \y.y
  - x was substituted by \y.y
- Function applications are left associative, so
  (\x.x)(\y.y)z = ((\x.x)(\y.y))z

- The body may have variables not in the head: \x.xy
- Example: (\x.xy)z = zy

- Functions with multiple arguments have nested heads
- Example: \xy.xy = \x.(\y.xy)
- Concrete example: (\xy.xy) 1 2 = (\x.(\y.xy)) 1 2 = (\y.1y) = 1 2
- Another: (\xy.xy) (\z.a) 1 =
           (\x.(\y.xy)) (\z.a) 1 =
           (\y.(\z.a)y) 1 =
           (\z.a) 1 =
           a

- Exercise 1: b
- Exercise 2: c
- Exercise 3: b

- Beta normal form: you cannot beta reduce the terms any further,
  i.e., the expression is fully evaluated or the program is fully executed

- Combinator: no free variables
- Examples: \xy.x, \xyz.xz(yz)
- Anti-examples: \y.x (x is free), \x.xz (z is free)

- Divergence: (\x.xx)(\x.xx) = (\x.xx)(\x.xx), never terminates

- Exercises:
  - Combinators. 1. Yes, 2. No, 3. Yes, 4. Yes, 5. No
  - Normal or diverge: 1. Normal, 2. Diverge, 3. Normal
  - Beta reduce:
    1. z
    2. bb
    3. qq
    4. yy
    5. yy
    6. aac
    7. \z.z'a

Chapter 2
---------

- Load a source file with :load in GHCi
- Unload the source file with :module
- WHNF: weak head normal form
  - not everything is evaluated immediately (lazy)
- Order of declarations in a source file doesn't matter
  (but it does matter in the REPL)
- mod and rem are slightly different when negative numbers are involved
- When negating in an expression, use parentheses: 2000 + (-1234)

Chapter 3
---------

- "concat" concatenates a list of Strings together,
  or any other list of lists (Strings are lists of Chars)
- Some list functions, like head and tail are considered "unsafe"
  because they may throw an exception; don't use them in large programs

Chapter 4
---------

- Type constructor is the name of the type (e.g., Bool)
- Data constructor is the name of a value of a type (e.g., True)
- Datatypes may use logical disjunction` (e.g., True | False)
  or may use logical conjunction (no example yet)
- Most programs should use Integer, not Int (unless really needed)
- For non-integers, it's better to use Scientific type
  rather than Float or Double
- The "arity" of a tuple is the number of elements it has
- Use tuples to represent an anonymous result

Chapter 5
---------

- Arrow (->) is the type constructor for functions
- Types are right associative:
  f :: a -> a -> a associates as f :: a -> (a -> a)
- Function application is left associative
- Functions to curry or uncurry:
  let curry f a b = f (a, b)  -- e.g., curry fst 1 2
  let uncurry f (a, b) = f a b  -- e.g., uncurry (+) (1, 2)
- Types can be concrete, constrained (or ad-hoc) polymorphic,
  or parametrically polymorphic
- An example of parametrically polymorphic is the identify function
  because it works for all types
- Something like (-10) is a polymorphic constant because Haskell
  does not give it a concrete type, but a polymorphic type
  (in this case, constrained by the typeclass Num)
- Code in a file (rather then in GHCi) does not end up
  with the most polymorphic type, so need to use a special
  LANGUAGE command

Chapter 6
---------

- Partial function is different from partial function application.
- Partial function is one that doesn't handle all possible cases,
  so try to avoid that situation because it can cause runtime errors.
- In GHC, turn on all warnings (-Wall) to detect partial functions.
- To define an instance of a typeclass with a parameter,
  one will often need to specify the typeclass constraint of the parameter.
- When implementing Ord, ensure the compare function matches
  equality so that if x == y, then compare x y == EQ
- The Show typeclass is not made for serialization,
  it's just for converting to String
- The () is called "unit" and it is the only value
  in the type by the same name "()"
- One way to think about "IO a" (e.g., IO String) is that it is a method
  for obtaining a value of type "a" which performs side effects
- "Dispatch" means what typeclass instance (from a type) to get
- type keyword creates a synonym (e.g., type Verb = String)

Chapter 7
---------

- Haskell uses lexical scoping, which means the inner-most variable
  or function name takes precedence, shadowing any outer names.
- Use :{ and :} in GHCi to enter a multi-line function
- "Bottom" is a non-value used to denote that a function cannot return a value,
  which will throw an exception if unhandled
- Use ":set -Wall" to turn on warnings (catches non-exhaustive pattern matching)
- Use ":browse [module]" to see a list of functions loaded from module
- -> is right-associative
- To use a function as a parameter of another function, enclose function
  with parantheses. For example, something :: (a -> b) -> a -> c -> b,
  where (a -> b) is a function parameter.
- Guards are always evaluated sequentially, so order them from
  most restrictive to the least.
- negate . sum [1, 2, 3] evaluates to negate . 6 (which causes an error).
  This is because the function operator has higher precedence
  than the composition operator. Use (negate . sum) [1, 2, 3] or
  negate . sum $ [1, 2, 3]. The $ has very low presedence, so it's done last.
- The curry function transforms a function with multiple arguments
  (in a tuple) to one with single arguments.
- The uncurry function transform a function with single arguments
  (like the + function) to one with multiple arguments in a tuple.

Last stopped on p. 266 on 7/26/17
