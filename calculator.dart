import 'dart:io';

/// Performs a basic arithmetic operation based on the provided operator.
/// [num1] The first number for the operation.
/// [num2] The second number for the operation.
/// [operator] The mathematical operator (+, -, *, /, %).
/// Returns:
/// - The result of the operation as a double.
/// Throws:
/// - [ArgumentError] if the operator is not recognized.
/// - [DivisionByZeroException] if division by zero is attempted.
double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        throw DivisionByZeroException("Cannot divide by zero.");
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw DivisionByZeroException("Cannot modulo by zero.");
      }
      return num1 % num2;
    default:
      throw ArgumentError("Invalid operator: $operator");
  }
}

/// Custom exception for division by zero.
class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException(this.message);

  @override
  String toString() => "DivisionByZeroException: $message";
}

void main() {
  print("Enter the first number:");
  String? input1 = stdin.readLineSync();
  print("Enter the second number:");
  String? input2 = stdin.readLineSync();
  print("Enter the operator (+, -, *, /, %):");
  String? operator = stdin.readLineSync();

  try {
    if (input1 != null && input2 != null && operator != null) {
      double num1 = double.parse(input1);
      double num2 = double.parse(input2);

      double result = calculate(num1, num2, operator);
      print('Result: $result');
    } else {
      print("Invalid input. Please provide valid numbers and an operator.");
    }
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}