// Function to perform basic arithmetic calculations based on an operator
double basicCalculator(double num1, double num2, String operator) {
  // Perform the calculation based on the operator provided
  switch (operator) {
    case '+':
      return num1 + num2; // Addition
    case '-':
      return num1 - num2; // Subtraction
    case '*':
      return num1 * num2; // Multiplication
    case '/':
      // Check for division by zero and throw an error if true
      if (num2 == 0) {
        throw ArgumentError('Division by zero is not allowed');
      }
      return num1 / num2; // Division
    case '%':
      // Check for modulo by zero and throw an error if true
      if (num2 == 0) {
        throw ArgumentError('Modulo by zero is not allowed');
      }
      return num1 % num2; // Modulo operation
    default:
      // Throw an error for an invalid operator
      throw ArgumentError('Invalid operator');
  }
}

// Function to evaluate a mathematical expression given as a string
double evaluateExpression(String expression) {
  // Split the expression into tokens based on spaces
  List<String> tokens = expression.split(' ');

  // Initialize the result with the first number in the tokens
  double result = double.parse(tokens[0]);

  // Loop through the tokens, starting from the second token
  for (int i = 1; i < tokens.length; i += 2) {
    String operator = tokens[i]; // Get the operator
    double nextNumber = double.parse(tokens[i + 1]); // Get the next number

    // Perform the operation using the basicCalculator function
    result = basicCalculator(result, nextNumber, operator);
  }

  return result; // Return the final result of the expression evaluation
}
