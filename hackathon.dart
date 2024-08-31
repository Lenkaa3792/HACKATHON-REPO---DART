import 'dart:math';

void main() {
  // Palindrome Checker
  print("Palindrome Checker:");
  print(isPalindrome("racecar")); // true
  print(isPalindrome("A man, a plan, a canal: Panama")); // true
  print(isPalindrome("12321")); // true
  print(isPalindrome("12345")); // false
  print(isPalindrome("Madam, I'm Adam!")); // true
  print(isPalindrome("Hello World!")); // false

  // Sorting Algorithm Implementation
  print("\nSorting Algorithm Implementation:");
  List<int> numbers = [5, 2, 9, 1, 7, 4, 8, 3, 6];
  print("Original List: $numbers");
  print("Quick Sort: ${quickSort(numbers)}");
  print("Merge Sort: ${mergeSort(numbers)}");
  print("Bubble Sort: ${bubbleSort(numbers)}");

  // Basic Calculator Function
  print("\nBasic Calculator Function:");
  print(calculate(5, 2, "+")); // 7
  print(calculate(5, 2, "-")); // 3
  print(calculate(5, 2, "*")); // 10
  print(calculate(5, 2, "/")); // 2.5
  print(calculate(5, 2, "%")); // 1

  // Bonus: Multi-step operations
  print("\nMulti-step Operations:");
  print(calculateMultiStep("5 + 2 * 3 - 1")); // 10
  print(calculateMultiStep("10 / 2 + 3 * 4")); // 17

  // Bonus: Error handling for division by zero
  print("\nError Handling for Division by Zero:");
  print(calculate(5, 0, "/")); // Error: Division by zero
}

// Palindrome Checker
bool isPalindrome(String text) {
  // Remove spaces, punctuation, and convert to lowercase
  String cleanText = text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

  // Check if the string is equal to its reverse
  return cleanText == cleanText.split('').reversed.join('');
}

// Quick Sort
List<int> quickSort(List<int> numbers) {
  // Base case: Empty list or list with only one element is sorted
  if (numbers.length <= 1) {
    return numbers;
  }

  // Choose a pivot element
  int pivot = numbers[0];

  // Partition the list into two sub-lists
  List<int> less = [];
  List<int> greater = [];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < pivot) {
      less.add(numbers[i]);
    } else {
      greater.add(numbers[i]);
    }
  }

  // Recursively sort the sub-lists and combine them with the pivot
  return [...quickSort(less), pivot, ...quickSort(greater)];
}

// Merge Sort
List<int> mergeSort(List<int> numbers) {
  // Base case: Empty list or list with only one element is sorted
  if (numbers.length <= 1) {
    return numbers;
  }

  // Divide the list into two halves
  int mid = numbers.length ~/ 2;
  List<int> left = numbers.sublist(0, mid);
  List<int> right = numbers.sublist(mid);

  // Recursively sort the halves
  left = mergeSort(left);
  right = mergeSort(right);

  // Merge the sorted halves
  return merge(left, right);
}

// Merge Function
List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0;
  int j = 0;

  // Compare elements from the left and right lists and add the smaller one to the result list
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // Add remaining elements from the left or right list
  while (i < left.length) {
    result.add(left[i]);
    i++;
  }

  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}

// Bubble Sort
List<int> bubbleSort(List<int> numbers) {
  // Iterate through the list, comparing adjacent elements and swapping them if they are in the wrong order
  for (int i = 0; i < numbers.length - 1; i++) {
    for (int j = 0; j < numbers.length - i - 1; j++) {
      if (numbers[j] > numbers[j + 1]) {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }

  return numbers;
}

// Basic Calculator Function
double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case "+":
      return num1 + num2;
    case "-":
      return num1 - num2;
    case "*":
      return num1 * num2;
    case "/":
      if (num2 == 0) {
        // Handle division by zero error gracefully
        // You could:
        // - Return a specific value like 'double.infinity' or 'double.nan'
        // - Throw a more specific exception
        // - Provide a custom error message
        throw Exception("Division by zero");
      } else {
        return num1 / num2;
      }
    case "%":
      return num1 % num2;
    default:
      // Handle invalid operator error gracefully
      // You could:
      // - Return a default value
      // - Throw a more specific exception
      // - Provide a custom error message
      throw Exception("Invalid operator");
  }
}

// Bonus: Multi-step operations
double calculateMultiStep(String expression) {
  // Split the expression into tokens
  List<String> tokens = expression.split(RegExp(r'(\+|\-|\*|\/|\%)'));

  // Initialize the result with the first number
  double result = double.parse(tokens[0]);

  // Iterate through the tokens, performing operations
  for (int i = 1; i < tokens.length; i += 2) {
    String operator = tokens[i];
    double num2 = double.parse(tokens[i + 1]);
    result = calculate(result, num2, operator);
  }

  return result;
}