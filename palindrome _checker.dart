//Main Funtions
// All other functions are called in this function to test them
// This is The entry point of the program and where execution starts
void main() {
  //Task 1 Test Cases
  print(isPalidromeExtended("A man, a plan, a canal: Panama"));
  print(isPalidromeExtended('Madam'));
  print(isPalidromeExtended(113311));

}

// Task 1  Palindrome Checker

//Function to check if a given input (String or number ) is a palindrome or not

bool isPalidrome(String input) {
  //convert the input to lower case and remove all non-alphanumeric characters
  String correctedInput =
      input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  //initialize two Pointers for checking palidrome
  int leftPointer = 0;
  int rightPointer = correctedInput.length - 1;

  //check if the String is a palidrome by comparing characters from both ends
  while (leftPointer < rightPointer) {
    if (correctedInput[leftPointer] != correctedInput[rightPointer]) {
      return false;
    }

    leftPointer++;
    rightPointer--;
  }
  return true;
}

//Extended function to handle both STring and numeric inputs
bool isPalidromeExtended(dynamic input) {
  //convert numeric input to String for uniformity
  String inputString = input.toString();
  return isPalidrome(inputString);
}






