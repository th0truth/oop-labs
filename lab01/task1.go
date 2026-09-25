package main

import "fmt"

func task1() {
	fmt.Println("\n---- TASK 1: f(x) = x^2 ---")

	xmin := readFloat("Enter xmin: ")
	xmax := readFloat("Enter xmax: ")

	var dx float64

	for {
		dx = readFloat("Enter step dx (> 0): ")
		if dx > 0 {
			break
		}
		fmt.Println("Step must be greated than 0.")
	}

	fmt.Println("\n     x     |      y")
	fmt.Println("----------------------")

	var max, min, sum float64
	positive, negative, count := 0, 0, 0

	// The 1e-9 is a tiny tolerance so float rounding doesn't drop the last point.
	for x := xmin; x <= xmax+1e-9; x += dx {
		y := x * x
		fmt.Printf("%9.2f | %10.2f\n", x, y)

		if count == 0 {
			max, min = y, y
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

	fmt.Printf("Max value:      %.2f\n", max)
	fmt.Printf("Min value:      %.2f\n", min)
	fmt.Printf("Average value:  %.2f\n", sum/float64(count))
	fmt.Printf("Positive count: %d\n", positive)
	fmt.Printf("Negative count: %d\n", negative)
}
