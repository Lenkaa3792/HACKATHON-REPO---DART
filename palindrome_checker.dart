// Function to check if a given string is a palindrome
bool isPalindrome(String input) {
  // Remove spaces, punctuation, and convert to lowercase
  String cleanedInput = input
      .replaceAll(RegExp(r'[^A-Za-z0-9]'),
          '') // Remove non-alphanumeric characters using a regular expression
      .toLowerCase(); // Convert the cleaned string to lowercase for case-insensitive comparison

  // Check if the cleaned input is equal to its reverse
  String reversedInput =
      cleanedInput.split('').reversed.join(''); // Reverse the cleaned input
  return cleanedInput ==
      reversedInput; // Return true if the cleaned input is the same as its reverse
}

// Function to check if a given number is a palindrome
bool isNumericPalindrome(num input) {
  // Convert the number to a string for palindrome checking
  String inputString =
      input.toString(); // Convert the numeric input to a string
  return isPalindrome(
      inputString); // Use the isPalindrome function to check if the string representation is a palindrome
}
