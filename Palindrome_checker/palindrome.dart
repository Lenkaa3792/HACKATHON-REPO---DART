//function for checking if a string is a palindrome


bool isPalindrome(String input) {
  //remove all spaces and special characters and convert to lowercase
  String cleanInput = input.replaceAll(RegExp(r'[^A-Za-z0-9]'), '' ).toLowerCase();

  //reverse the clean string

  String reverseInput = cleanInput.split('').reversed.join('');

  //compare the clean string with the reversed string if they are equal it is a palindrome
  return cleanInput == reverseInput;
}


//fuctiion for checking if an integer is a palindrome

bool isNumericPalindrome(int number) {

  //convert the number to a string
  String numberString = number.toString();

  //USE the isPalindrome function
  return isPalindrome(numberString);
}


void main() {
  //test cases for strings
  print(''); //This is just for spacing
  print('Results for strings:');
  print(isPalindrome('racecar'));
  print(isPalindrome('hello'));
  print(isPalindrome('kayak'));
  print(isPalindrome('madam'));
  print(isPalindrome('tacocat'));
  print(isPalindrome(''));
  print('');
  //test cases for integers
  print('Results for integers tests:');
  print(isNumericPalindrome(12321));
  print(isNumericPalindrome(12345));
  print(isNumericPalindrome(323));

}