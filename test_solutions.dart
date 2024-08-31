import 'dart:math'; // Importing the math library for random number generation
import 'palindrome_checker.dart'; // Importing the palindrome checker functions
import 'sorting_algorithm.dart'; // Importing sorting algorithm functions
import 'calculator.dart'; // Importing calculator functions

// Function to test palindrome functionality
void palindromeTest() {
  // Test cases for string inputs
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("nurses run")); // true
  print(isPalindrome("racecar")); // true
  print(isPalindrome("hello")); // false

  // Test cases for numeric inputs
  print(isNumericPalindrome(12321)); // true
  print(isNumericPalindrome(12345)); // false
}

// Function to test sorting algorithms with a hard-coded list
void hardCodedSortingTest() {
  // Define a simple, hard-coded list of integers
  List<int> hardCodedList = [34, 7, 23, 32, 5, 62];

  // Print the original list
  print("Original list: $hardCodedList");

  // Measure time for Quick Sort
  final quickSortStart = DateTime.now(); // Record start time
  List<int> sortedListQuick = quickSort(hardCodedList); // Sort the list
  final quickSortEnd = DateTime.now(); // Record end time
  final quickSortDuration = quickSortEnd
      .difference(quickSortStart)
      .inMilliseconds; // Calculate duration

  // Print the sorted list and time taken for Quick Sort
  print("Sorted list (Quick Sort): $sortedListQuick");
  print("Quick Sort Duration: $quickSortDuration ms");

  // Measure time for Bubble Sort
  final bubbleSortStart = DateTime.now(); // Record start time
  List<int> sortedListBubble = bubbleSort(hardCodedList); // Sort the list
  final bubbleSortEnd = DateTime.now(); // Record end time
  final bubbleSortDuration = bubbleSortEnd
      .difference(bubbleSortStart)
      .inMilliseconds; // Calculate duration

  // Print the sorted list and time taken for Bubble Sort
  print("Sorted list (Bubble Sort): $sortedListBubble");
  print("Bubble Sort Duration: $bubbleSortDuration ms");
}

// Function to test sorting algorithms with a random list
void randomSortingTest() {
  // Generate a list of random integers
  List<int> randomList = List.generate(10000, (_) => Random().nextInt(10000));

  // Copy the list for fair comparison
  List<int> bubbleSortList = List.from(randomList); // Copy for Bubble Sort
  List<int> quickSortList = List.from(randomList); // Copy for Quick Sort

  // Measure Bubble Sort time
  final bubbleSortStart = DateTime.now(); // Record start time
  bubbleSort(bubbleSortList); // Sort the list
  final bubbleSortEnd = DateTime.now(); // Record end time
  final bubbleSortDuration = bubbleSortEnd
      .difference(bubbleSortStart)
      .inMilliseconds; // Calculate duration

  // Measure Quick Sort time
  final quickSortStart = DateTime.now(); // Record start time
  quickSort(quickSortList); // Sort the list
  final quickSortEnd = DateTime.now(); // Record end time
  final quickSortDuration = quickSortEnd
      .difference(quickSortStart)
      .inMilliseconds; // Calculate duration

  // Print durations for both sorting algorithms
  print('Bubble Sort Duration: $bubbleSortDuration ms');
  print('Quick Sort Duration: $quickSortDuration ms');
}

// Function to test the basic calculator operations
void calculatorTest() {
  try {
    // Test basic calculations
    print(basicCalculator(10, 5, '+')); // Expected output: 15.0
    print(basicCalculator(
        10, 0, '/')); // Expected to throw an error for division by zero
  } catch (error) {
    print(error); // Print error message
  }

  try {
    // Test evaluating expressions
    print(evaluateExpression("10 + 5 * 2")); // Expected output: 20.0
    print(evaluateExpression("20 / 4 - 3")); // Expected output: 2.0
  } catch (error) {
    print(error); // Print error message
  }
}

// Main function to run all tests
void main() {
  print("---------------------------------");
  print("Tests for Palindrome Checker Task");
  print("---------------------------------");
  palindromeTest(); // Run palindrome tests

  print("\n-----------------------------------------------");
  print("Tests for Sorting Algorithm Implementation Task");
  print("-----------------------------------------------");
  print("Test for Small Data");
  print(":::::::::::::::::::");
  hardCodedSortingTest(); // Run sorting test for small data
  print("\nTest for Large Data");
  print(":::::::::::::::::::");
  randomSortingTest(); // Run sorting test for large data

  print("\n----------------------------------------");
  print("Tests for Basic Calculator Function Task");
  print("----------------------------------------");
  calculatorTest(); // Run calculator tests
}
