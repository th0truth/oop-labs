package main

import (
	"fmt"
	"lab01/internal/input"
	"lab01/internal/tasks"
)

func main() {
	for {
		fmt.Println("\n===== MENU =====")
		fmt.Println("1 - Function f(x) = x^2")
		fmt.Println("2 - Function f(x1,x2) = x1^2 + e^x2")
		fmt.Println("3 - Factorial and sum of factorials")
		fmt.Println("4 - Perfect numbers in a range")
		fmt.Println("5 - Text analysis")
		fmt.Println("0 - Exit")

		switch input.Int("Your choice: ") {
		case 1:
			tasks.Task1()
		case 2:
			tasks.Task2()
		case 3:
			tasks.Task3()
		case 4:
			tasks.Task4()
		case 5:
			tasks.Task5()
		case 0:
			fmt.Println("Goodbye!")
			return
		default:
			fmt.Println("Wrong choice, try again.")
		}
	}
}
