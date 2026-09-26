package input

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// One shared reader for the whole program, reading from standard input.
var reader = bufio.NewReader(os.Stdin)

// Line reads a whole line of text (spaces included) and trims the newline.
func Line(prompt string) string {
	fmt.Print(prompt)
	text, _ := reader.ReadString('\n')
	return strings.TrimSpace(text)
}

// Int keeps asking until the user types a valid whole number.
func Int(prompt string) int {
	for {
		value, err := strconv.Atoi(Line(prompt))
		if err != nil {
			fmt.Println("Please enter a whole number.")
			continue
		}
		return value
	}
}

// Float keeps asking until the user types a valid number.
func Float(prompt string) float64 {
	for {
		value, err := strconv.ParseFloat(Line(prompt), 64)
		if err != nil {
			fmt.Println("Please enter a number (use . for decimals).")
			continue
		}
		return value
	}
}

// Keeps asking until the user types a number greater than 0.
func PositiveFloat(prompt string) float64 {
	for {
		value := Float(prompt)
		if value > 0 {
			return value
		}
		fmt.Println("Value must be greater than 0.")
	}
}
