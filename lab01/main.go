package main

import "fmt"

func main() {
	for {
		fmt.Println("\n==== MENU =====")
		fmt.Println("1 - Function f(x) = x^2")
		fmt.Println("2 - Function f(x1,x2) = x1^2 + e^x2")
		fmt.Println("3 - Factorial and sum of factorials")
		fmt.Println("4 - Perfect numbers in a range")
		fmt.Println("5 - Text analysis")
		fmt.Println("0 - Exit")
		fmt.Print("Your choice: ")

		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			task1()
		case 2:
			task2()
		case 3:
			task3()
		case 4:
			task4()
		case 0:
			fmt.Println("Goodbye!")
			return
		default:
			fmt.Println(("Wrong choice, try again"))
		}
	}
}
