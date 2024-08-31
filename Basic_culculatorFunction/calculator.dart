

// Function to perform basic arithmetic operations
double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2; // Addition
    case '-':
      return num1 - num2; // Subtraction
    case '*':
      return num1 * num2; // Multiplication
    case '/':
      if (num2 == 0) {
        throw ArgumentError('Cannot divide by zero'); // Error handling for division by zero
      }
      return num1 / num2; // Division
    case '%':
      if (num2 == 0) {
        throw ArgumentError('Cannot divide by zero'); // Error handling for modulus by zero
      }
      return num1 % num2; // Modulus
    default:
      throw ArgumentError('Invalid operator'); // Error handling for invalid operator
  }
}



void main() {
  try {
    // Test cases for the calculate function
    print(calculate(10, 5, '+')); // 15.0
    print(calculate(10, 5, '-')); // 5.0
    print(calculate(10, 5, '*')); // 50.0
    print(calculate(10, 5, '/')); // 2.0
    print(calculate(10, 5, '%')); // 0.0
    print(calculate(10, 0, '/')); // Error: Cannot divide by zero
  } catch (e) {
    print(e); // Print the error message if an exception is thrown
  }
}
