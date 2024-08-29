import 'dart:io';

/// Checks if a given string is a palindrome. 
/// The function is case-insensitive and ignores spaces and punctuation.
/// It also works with numeric inputs.
/// Returns:
/// - true if the string is a palindrome else false otherwise.
bool isPalindrome(String input) {
  // Helper function to clean the input by removing non-alphanumeric characters and converting to lowercase
  String _cleanInput(String input) {
    // Remove all non-alphanumeric characters and convert to lowercase
    return input
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '') // Remove non-alphanumeric characters
        .toLowerCase(); // Convert to lowercase
  }

  // Clean the input string
  final cleanedInput = _cleanInput(input);

  // Compare the cleaned input with its reverse
  return cleanedInput == cleanedInput.split('').reversed.join('');
}

void main() {
  print("Enter a string to check if it is a palindrome:");
  String? userInput = stdin.readLineSync();

  if (userInput != null) {
    bool result = isPalindrome(userInput);
    print('"$userInput" is palindrome: $result');
  } else {
    print("No input provided.");
  }
}