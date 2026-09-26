package tasks

import (
	"fmt"
	"math"

	"lab01/internal/input"
)

func Task2() {
	fmt.Println("\n--- Task 2: f(x1, x2) = x1^2 + e^x2 ---")

	x1min := input.Float("Enter x1min: ")
	x1max := input.Float("Enter x1max: ")
	dx1 := input.PositiveFloat("Enter step dx1 (> 0): ")

	x2min := input.Float("Enter x2min: ")
	x2max := input.Float("Enter x2max: ")
	dx2 := input.PositiveFloat("Enter step dx2 (> 0): ")

	fmt.Println("\n    x1     |     x2     |      y")
	fmt.Println("------------------------------------")

	var max, min, sum float64
	positive, negative, count := 0, 0, 0

	// Outer loop over x1; for each x1, inner loop
	// over the whole x2 range
	for x1 := x1min; x1 <= x1max+1e-9; x1 += dx1 {
		for x2 := x2min; x2 <= x2max+1e-9; x2 += dx2 {
			y := x1*x1 + math.Exp(x2)
			fmt.Printf("%10.2f | %10.2f | %10.2f\n", x1, x2, y)

			if count == 0 {
				max, min = y, y
			} else if y > max {
				min = y
			}

			sum += y

			if y > 0 {
				positive++
			} else if y < 0 {
				negative++
			}

			count++
		}
	}

	fmt.Println("------------------------------------")

	if count == 0 {
		fmt.Println("No values in the given range.")
		return
	}

	average := sum / float64(count)

	fmt.Printf("Max value:      %.2f\n", max)
	fmt.Printf("Min value:      %.2f\n", min)
	fmt.Printf("Average value:  %.2f\n", average)
	fmt.Printf("Positive count: %d\n", positive)
	fmt.Printf("Negative count: %d\n", negative)
}
