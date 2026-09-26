package tasks

import (
	"fmt"
	"strings"
	"unicode"

	"lab01/internal/input"
)

func countChar(text string) int {
	count := 0

	// range decodes runers (int32 that represents Unicode char), not bytes
	for range text {
		count++
	}

	return count
}

func countWords(text string) int {
	return len(strings.Fields(text))
}

func countSentences(text string) int {
	return len(strings.FieldsFunc(text, func(r rune) bool {
		return r == '.' || r == '!' || r == '?'
	}))
}

func countVowelsConsonants(text string) (int, int) {
	const vowels = "aeiouAEIOUаеєиіїоуюяАЕЄИІЇОУЮЯ"
	vowelCount, consonantCount := 0, 0

	for _, r := range text {
		if unicode.IsLetter(r) {
			if strings.ContainsRune(vowels, r) {
				vowelCount++
			} else {
				consonantCount++
			}
		}
	}

	return vowelCount, consonantCount
}

func Task5() {
	fmt.Println("\n--- Task 5: Text analysis ---")

	text := input.Line("Enter text to analyze: ")

	if text == "" {
		fmt.Println("Text cannot be empty.")
		return
	}

	vowels, consonants := countVowelsConsonants(text)

	fmt.Println("\n+------------------------+--------+")
	fmt.Printf("| %-22s | %6d |\n", "Characters", countChar(text))
	fmt.Printf("| %-22s | %6d |\n", "Words", countWords(text))
	fmt.Printf("| %-22s | %6d |\n", "Sentences", countSentences(text))
	fmt.Printf("| %-22s | %6d |\n", "Vowels", vowels)
	fmt.Printf("| %-22s | %6d |\n", "Consonants", consonants)
	fmt.Println("+------------------------+--------+")
}
