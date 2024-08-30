
#  Hackathon Challenge Solutions
Welcome to the repository containing solutions to the hackathon challenges. This project showcases solutions for three distinct tasks, focusing on algorithm implementation, string manipulation, and arithmetic computation in Dart. The solutions prioritize code quality, readability, correctness, efficiency, fault tolerance, and thorough documentation.

# Table of Contents
- Palindrome Checker
- Sorting Algorithms
- Basic Calculator
- Installation
- How to Run
- Testing

## Palindrome Checker
### Overview
The Palindrome Checker is a Dart function designed to determine if a given string or numeric input is a palindrome. The function ignores spaces, punctuation, and is case-insensitive, making it versatile for different types of input.

### Features
- String and Numeric Input Handling: Checks for palindrome properties in both strings and numbers.
- Edge Case Handling: Handles inputs like empty strings, single characters, and numbers.
- Case Insensitivity: Ignores letter cases to ensure accurate palindrome checking.

### Function Signature
bool isPalindrome(dynamic input);
### Usage

void main() {
  print(isPalindrome("A man, a plan, a canal, Panama")); // Output: true
  print(isPalindrome(12321)); // Output: true
  print(isPalindrome("Hello, World!")); // Output: false
}

## Sorting Algorithms
### Overview
The Sorting Algorithms task implements three sorting algorithms in Dart: Quick Sort, Merge Sort, and Bubble Sort. The program compares their performance in terms of execution time, helping to illustrate the efficiency of each algorithm.

### Features
- Multiple Sorting Algorithms: Includes Quick Sort, Merge Sort, and Bubble Sort.
- Performance Comparison: Measures and compares execution time for each sorting algorithm.
- Efficiency: Optimized implementations demonstrate a clear understanding of algorithmic complexity.

### Function Signatures

List<int> quickSort(List<int> list);
List<int> mergeSort(List<int> list);
List<int> bubbleSort(List<int> list);
void compareSortingAlgorithms(List<int> list);


### Usage
void main() {
  List<int> list = [34, 7, 23, 32, 5, 62, 32, 4, 22, 11, 90, 67];
  compareSortingAlgorithms(list);
  // Outputs execution times for each sorting algorithm.
}

## Basic Calculator
### Overview
The Basic Calculator function performs basic arithmetic operations (+, -, *, /, %) on two numbers. It also handles multi-step operations and includes error handling for cases like division by zero.

### Features
- Basic Arithmetic Operations: Supports addition, subtraction, multiplication, division, and modulus.
- Multi-Step Operations: Can evaluate expressions with multiple operations.
- Error Handling: Handles division by zero and invalid operators gracefully.

### Function Signatures
double basicCalculator(double num1, double num2, String operator);
double multiStepCalculator(String expression);

### Usage
void main() {
  print(basicCalculator(10, 5, '+'));  // Output: 15.0
  print(multiStepCalculator('3 + 5 * 2 - 4 / 2'));  // Output: 10.0
}


## Installation
To run these Dart programs, you need to have Dart installed on your machine.

1. Install Dart
2. Clone the repository:
    - git clone  https://github.com/Erasto-M/HACKATHON-REPO---DART.git
    - cd HACKATHON-REPO---DART


## How to Run
After installing Dart and cloning the repository, navigate to the directory of each task and run the Dart file:
- dart run palindrome_checker.dart
- dart run sorting_algorithms.dart
- dart run basic_calculator.dart

## Testing
### Palindrome Checker
Test the function with different strings and numeric inputs, including edge cases like empty strings and single characters.

### Sorting Algorithms
Test with various integer lists, including sorted, reverse sorted, and random order lists to see the performance comparison.

### Basic Calculator
Test with valid and invalid operators and numbers to ensure all arithmetic operations work correctly and error handling is robust.

## Conclusion
This repository provides solutions to the hackathon tasks, demonstrating proficiency in Dart programming with a focus on code quality, readability, and efficiency. We hope these solutions meet the challenge criteria and provide clear, maintainable code for future development.



Feel free to contribute or raise issues if you find any improvements or bugs!
