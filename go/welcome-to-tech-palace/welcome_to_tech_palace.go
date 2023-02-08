package techpalace

import (
	"fmt"
	"strings"
)

const (
	defaultWelcomeMsg = "Welcome to the Tech Palace, "
	defaultBorderRune = "*"
)

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return defaultWelcomeMsg + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	border := strings.Repeat(defaultBorderRune, numStarsPerLine)
	return fmt.Sprintf("%s\n%s\n%s", border, welcomeMsg, border)

	// I was going to concatonate the strings as done in the line below...
	// but I found the fmt.Sprintf function which I decided to use...
	// as it is cleaner IMO:
	// return border + "\n" + welcomeMsg + "\n" + border
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	secondRow := strings.Split(oldMsg, "\n")[1]
	return strings.Trim(secondRow, defaultBorderRune+" ")
}
