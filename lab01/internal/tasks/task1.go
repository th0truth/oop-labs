package tasks

import (
	"fmt"

	"lab01/internal/input"
)

func Task1() {
	fmt.Println("\n--- Task 1: f(x) = x^2 ---")

	xmin := input.Float("Enter xmin: ")
	xmax := input.Float("Enter xmax: ")

	// dx must be positive, otherwise the loop would never finish.
	var dx float64

	for {
		dx = input.Float("Enter step dx (> 0): ")
		if dx > 0 {
			break
		}
		fmt.Println("Step must be greater than 0.")
	}

	fmt.Println("\n     x     |      y")
	fmt.Println("----------------------")

	var max, min, sum float64
	positive, negative, count := 0, 0, 0

	// +1e-9 is a tiny tolerance so float rounding doesn't drop the last point.
	for x := xmin; x <= xmax+1e-9; x += dx {
		y := x * x
		fmt.Printf("%9.2f | %10.2f\n", x, y)

		if count == 0 {
			max, min = y, y // first value seeds both
		} else if y > max {
			max = y
		} else if y < min {
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

	fmt.Println("----------------------")

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
