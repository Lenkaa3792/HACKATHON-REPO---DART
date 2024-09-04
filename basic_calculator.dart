// basic_calculator.dart

/// Performs basic arithmetic operations.
///
/// [num1] is the first number, [num2] is the second number, and [operator] is the arithmetic operation.
///
/// Throws [ArgumentError] if [operator] is invalid or if division/modulus by zero is attempted.
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
        throw ArgumentError('Cannot divide by zero');
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw ArgumentError('Cannot divide by zero');
      }
      return num1 % num2;
    default:
      throw ArgumentError('Invalid operator');
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
