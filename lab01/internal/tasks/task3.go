package tasks

import (
	"fmt"

	"lab01/internal/input"
)

func factorialRecursion(n int64) int64 {
	if n == 0 {
		return 1
	} else {
		return n * factorialRecursion(n-1)
	}
}

func factorialIterative(n int64) (int64, int64) {
	var factorial, sum int64
	factorial, sum = 1, 0

	if n == 0 {
		return factorial, sum
	} else {
		for i := int64(1); i <= n; i++ {
			factorial *= i
			sum += factorial
		}
	}

	return factorial, sum
}

func Task3() {
	fmt.Println("\n--- Task 3: Factorial and sum of factorials ---")

	n := int64(input.Int("Enter n: "))

	fmt.Println("\n  i  |         i!          |    sum of 1!..i!")
	fmt.Println("-----------------------------------------------")

	var sum int64 = 0
	for i := int64(1); i <= n; i++ {
		f := factorialRecursion(i)
		sum += f

		fmt.Printf("%3d | %19d | %19d\n", i, f, sum)
	}
	fmt.Println("-----------------------------------------------")

	fact, total := factorialIterative(int64(n))
	fmt.Printf("Factorial of %d = %d\n", n, fact)
	fmt.Printf("Sum of all factorials 1!..%d! = %d\n", n, total)
}
