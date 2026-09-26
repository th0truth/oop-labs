package tasks

import (
	"fmt"
	"lab01/internal/input"
	"strconv"
	"strings"
)

// Returns all proper divisors of n.
func properDivisors(n int) []int {
	var divisors []int

	for i := 1; i < n; i++ {
		if n%i == 0 {
			divisors = append(divisors, i)
		}
	}

	return divisors
}

// Reports whether n equals the sum its proper divisors.
func isPerfect(n int) bool {
	if n < 2 {
		return false
	}

	sum := 0
	for _, d := range properDivisors(n) {
		sum += d
	}

	return sum == n
}

func Task4() {
	fmt.Println("\n--- Task 4: Perfect numbers in a range ---")

	start := input.Int("Enter range start: ")
	end := input.Int("Enter range end: ")
	if start > end {
		start, end = end, start
	}

	found := 0

	for number := start; number <= end; number++ {
		if !isPerfect(number) {
			continue
		}
		found++

		divisors := properDivisors(number)
		parts := make([]string, 0, len(divisors))

		for _, d := range divisors {
			parts = append(parts, strconv.Itoa(d))
		}

		fmt.Printf("%d is perfect: %s = %d\n", number, strings.Join(parts, " + "), number)
	}

	if found == 0 {
		fmt.Println("No perfect numbers found in this range.")
	}
}
