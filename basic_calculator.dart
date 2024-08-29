// basic_calculator.dart

// This function performs basic arithmetic operations
double calculate(double num1, double num2, String operator) {
  // Check the operator and perform the corresponding operation
  switch (operator) {
    case '+':
      return num1 + num2; // Addition
    case '-':
      return num1 - num2; // Subtraction
    case '*':
      return num1 * num2; // Multiplication
    case '/':
      // Check for division by zero
      if (num2 == 0) {
        throw ArgumentError(
            'Cannot divide by zero'); // Error message for division by zero
      }
      return num1 / num2; // Division
    case '%':
      // Check for division by zero
      if (num2 == 0) {
        throw ArgumentError(
            'Cannot divide by zero'); // Error message for division by zero
      }
      return num1 % num2; // Modulus
    default:
      throw ArgumentError(
          'Invalid operator'); // Error message for invalid operator
  }
}

void main() {
  // Example calculations
  try {
    print("5 + 3 = ${calculate(5, 3, '+')}"); // Expected output: 8.0
    print("10 - 2 = ${calculate(10, 2, '-')}"); // Expected output: 8.0
    print("4 * 7 = ${calculate(4, 7, '*')}"); // Expected output: 28.0
    print("20 / 4 = ${calculate(20, 4, '/')}"); // Expected output: 5.0
    print("10 % 3 = ${calculate(10, 3, '%')}"); // Expected output: 1.0
    print("20 / 0 = ${calculate(20, 0, '/')}"); // This will throw an error
  } catch (e) {
    // Catch and print errors
    print(e);
  }
}
