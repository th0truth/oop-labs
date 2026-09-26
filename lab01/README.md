# lab01

Menu-driven console app bundling five programs, written in Go.

## Requirements

- Go 1.21+

## Run

```sh
go run ./cmd/lab01
```

## Menu

| # | Program |
|---|---------|
| 1 | `f(x) = x²` over a range — table + min/max/average/sign counts |
| 2 | `f(x1, x2) = x1² + eˣ²` over a grid — table + statistics |
| 3 | Factorial of `n` and the sum `1!..n!` with intermediate results |
| 4 | Perfect numbers in a range, with their divisors |
| 5 | Text analysis: characters, words, sentences, vowels, consonants |

## Layout

```
cmd/lab01/     entry point + menu
internal/input/  validated stdin helpers
internal/tasks/  one file per program
```
