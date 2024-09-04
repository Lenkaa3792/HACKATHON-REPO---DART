// palindrome_checker.dart

/// Checks if the provided [input] string is a palindrome.
///
/// A palindrome is a string that reads the same forwards and backwards, ignoring non-alphanumeric characters and case.
bool isPalindrome(String input) {
  // Remove all non-alphanumeric characters and convert to lowercase
  String cleanedInput =
      input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

  // Reverse the cleaned input
  String reversedInput = cleanedInput.split('').reversed.join('');

  // Check if the cleaned input is the same as its reverse
  return cleanedInput == reversedInput;
}

void main() {
  // Test cases for palindrome checker
  print(
      "Is 'A man, a plan, a canal, Panama' a palindrome? ${isPalindrome("A man, a plan, a canal, Panama")}");
  print(
      "Is 'Madam, in Eden, I'm Adam,' a palindrome? ${isPalindrome("Madam, in Eden, I'm Adam,")}");
  print("Is 'Hello, World!' a palindrome? ${isPalindrome("Hello, World!")}");
  print("Is '12321' a palindrome? ${isPalindrome("12321")}");
  print("Is '12345' a palindrome? ${isPalindrome("12345")}");
  print("Is '45654' a palindrome? ${isPalindrome("45654")}");
  print("Is '45678' a palindrome? ${isPalindrome("45678")}");
}
