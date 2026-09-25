package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var reader = bufio.NewReader(os.Stdin)

// Reads a whole line of text (spaces included) and trims the newline.
func readLine(prompt string) string {
	fmt.Print(prompt)
	text, _ := reader.ReadString('\n')
	return strings.TrimSpace(text)
}

// Keeps asking until the user types a valid whole number.
func readInt(prompt string) int {
	for {
		value, err := strconv.Atoi(readLine(prompt))
		if err != nil {
			fmt.Println("Please enter a whole number.")
			continue
		}
		return value
	}
}

// Keeps asking until the user types a valid number
func readFloat(prompt string) float64 {
	for {
		value, err := strconv.ParseFloat(readLine(prompt), 64)
		if err != nil {
			fmt.Println("Please enter a number (use . for decimals).")
			continue
		}
		return value
	}
}
