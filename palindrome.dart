import 'dart:io';

//------- First we are converting a number to string for palindrome check. 
bool isPalindrome(dynamic input) {
  if (input is num) {
    return isPalindrome(input.toString());
  }

  //----------------- validation ---------------------------
  if (input is! String) {
    throw ArgumentError('Input must be a number or string!');
  }

  //------------------ Remove non-alphanumeric characters and convert to lowercase
  String cleaned = input
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .toLowerCase()
      .replaceAll(' ', '');

  if (cleaned.isEmpty) {
    return false;
  }

  //-------------- Let's compare characters from start and end
  for (int i = 0; i < cleaned.length ~/ 2; i++) {
    if (cleaned[i] != cleaned[cleaned.length - 1 - i]) {
      return false;
    }
  }

  return true;
}

//------------------- Main Application
void main() {
  print("Enter a value to check if it's a palindrome:");
  //--------- Taking user input. 
  String? userInput = stdin.readLineSync();

  if (userInput != null && userInput.isNotEmpty) {
    try {
      if (double.tryParse(userInput) != null) {
        print(isPalindrome(double.parse(userInput)));
      } else {
        print(isPalindrome(userInput));
      }
    } catch (err) {
      print('Error: $err');
    }
  } else {
    print('Invalid input!');
  }
}



///----------- WHAT IS A PALINDROME? ----------
/// A palindrome is a word or number that reads the same way forward and backward. e.eg. anna -  12321  