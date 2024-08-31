import 'dart:math';

bool isPalindrome(String input) {
  if (input.isEmpty) {
    return false;
  }

  final cleanedInput = input.toLowerCase().splitMapJoin(
    RegExp(r'[a-z0-9]'),
    onMatch: (match) => match.group(0)!,
    onNonMatch: (nonMatch) => '',
  );

  return cleanedInput == cleanedInput.split('').reversed.join('');
}

extension NumExtensions on num {
  bool isPalindrome() {
    final strNum = toString();
    return isPalindrome(strNum);
  }
}

// Test cases
void main() {
  print(isPalindrome("A man, a plan, a canal: Panama")); // true
  print(isPalindrome("race a car")); // false
  print(isPalindrome("12321")); // true
  print(isPalindrome("123456")); // false
  
  print(121.isPalindrome()); // true
  print(123.isPalindrome()); // false
}
