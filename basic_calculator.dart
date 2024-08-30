//Task 3 . Basic Calculator Implementation

/// A Dart function that performs basic arithmetic operations.
double basicCalculator(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        throw ArgumentError('Division by zero is not allowed.');
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw ArgumentError('Division by zero is not allowed.');
      }
      return num1 % num2;
    default:
      throw ArgumentError('Invalid operator. Supported operators are +, -, *, /, %.');
  }
}


// A Dart function that performs multi-step arithmetic operations.
// Example of valid input: "3 + 5 * 2 - 4 / 2"
double multiStepCalculator(String expression) {
  List<String> tokens = expression.split(' ');
  if (tokens.length % 2 == 0) {
    throw ArgumentError('Invalid expression format.');
  }

  // Initialize the result with the first number in the expression.
  double result = double.parse(tokens[0]);

  // Iterate over the expression in steps of 2 (operator and number pairs).
  for (int i = 1; i < tokens.length; i += 2) {
    String operator = tokens[i];
    double num = double.parse(tokens[i + 1]);
    result = basicCalculator(result, num, operator);
  }

  return result;
}

//Main function 
//entry point of the program 
void main() {
  // Test cases for basicCalculator function.
  try {
    print(basicCalculator(10, 5, '+'));  // Output: 15.0
    print(basicCalculator(10, 5, '-'));  // Output: 5.0
    print(basicCalculator(10, 5, '*'));  // Output: 50.0
    print(basicCalculator(10, 5, '/'));  // Output: 2.0
    print(basicCalculator(10, 5, '%'));  // Output: 0.0
    // Test division by zero.
    print(basicCalculator(10, 0, '/'));  // Throws an error.
  } catch (e) {
    print(e);
  }

  // Test cases for multiStepCalculator function.
  try {
    print(multiStepCalculator('3 + 5 * 2 - 4 / 2'));  // Output: 6.0
    print(multiStepCalculator('10 / 2 + 3 * 4 - 6 % 2'));  // Output: 0.0
    // Test invalid expression format.
    print(multiStepCalculator('3 + 5 *'));  // Throws an error.
  } catch (e) {
    print(e);
  }
}
