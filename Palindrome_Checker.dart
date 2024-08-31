import 'dart:core';

bool isPalindrome(String input) {
  // Normalize the input by removing spaces, punctuation, and converting to lowercase
  String normalizedInput = input
      .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '') // Remove non-alphanumeric characters
      .toLowerCase(); // Convert to lowercase for case insensitivity

  // Compare the normalized string with its reverse
  return normalizedInput == normalizedInput.split('').reversed.join('');
}

bool isNumericPalindrome(int number) {
  // Convert the number to a string and check if it's a palindrome
  return isPalindrome(number.toString());
}

void main() {
  // Test string palindrome
  print(isPalindrome("A man, a plan, a canal, Panama"));  // Output: true
  print(isPalindrome("hello"));  // Output: false

  // Test numeric palindrome
  print(isNumericPalindrome(12321));  // Output: true
  print(isNumericPalindrome(12345));  // Output: false
}