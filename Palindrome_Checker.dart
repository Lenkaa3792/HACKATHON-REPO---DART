import 'dart:io';

bool isPalindrome(String input) {
  // Remove spaces, punctuation and convert to lowercase
  String sanitized = input.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();

  // Check if the sanitized string is a palindrome
  String reversed = sanitized.split('').reversed.join('');
  return sanitized == reversed;
}

bool isNumericPalindrome(int number) {
  // Convert the number to a string and check using the isPalindrome function
  return isPalindrome(number.toString());
}

void main() {
  print("Enter a string or a number:");
  String? userInput = stdin.readLineSync();  // Read user input

  if (userInput != null) {
    // Check if the input is a numeric value
    if (int.tryParse(userInput) != null) {
      // The input is a number
      int number = int.parse(userInput);
      if (isNumericPalindrome(number)) {
        print("$number is a palindrome.");
      } else {
        print("$number is not a palindrome.");
      }
    } else {
      // The input is a string
      if (isPalindrome(userInput)) {
        print("\"$userInput\" is a palindrome.");
      } else {
        print("\"$userInput\" is not a palindrome.");
      }
    }
  } else {
    print("Invalid input.");
  }
}