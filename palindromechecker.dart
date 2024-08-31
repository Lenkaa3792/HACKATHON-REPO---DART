bool isPalindrome(String input) {
  // Normalize the string: remove spaces, punctuation, and convert to lowercase
  String normalizedInput = input.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();

  // Compare the normalized string with its reverse
  String reversedInput = normalizedInput.split('').reversed.join('');
  return normalizedInput == reversedInput;
}

bool isNumericPalindrome(int number) {
  String strNumber = number.toString();
  return isPalindrome(strNumber);
}

void main() {
  // Test with a string input
  print(isPalindrome("A man, a plan, a canal, Panama")); // Output: true

  // Test with a numeric input
  print(isNumericPalindrome(12321)); // Output: true
  print(isNumericPalindrome(12345)); // Output: false
}


