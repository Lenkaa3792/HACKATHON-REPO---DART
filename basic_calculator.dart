import 'dart:math';

// Basic Calculator function
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
        throw ArgumentError("Cannot divide by zero");
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw ArgumentError("Cannot perform modulo by zero");
      }
      return num1 % num2;
    case '^':
      return pow(num1, num2).toDouble();  // Use pow for exponentiation
    default:
      throw ArgumentError("Invalid operator");
  }
}

// Multi-step Calculator function
double multiStepCalculator(String expression) {
  try {
    // Remove any spaces and replace ^ with ** for exponentiation
    expression = expression.replaceAll(' ', '').replaceAll('^', '**');

    // Evaluate the expression (Assuming safe inputs, extend with a parser if needed)
    return _evaluateExpression(expression);
  } catch (e) {
    throw ArgumentError("Invalid expression: $e");
  }
}

double _evaluateExpression(String expression) {
  // Use a basic parser (or evaluate with a custom interpreter for more complex logic)
  // This is a placeholder for expression evaluation logic
  return double.parse(expression); // Naive implementation, for real use a proper parser
}

void main() {
  // Basic operations
  print(basicCalculator(10, 5, '+'));  // Output: 15.0
  print(basicCalculator(10, 5, '*'));  // Output: 50.0
  print(basicCalculator(10, 2, '^'));  // Output: 100.0
  
  // Multi-step operation
  print(multiStepCalculator("10 + 5 * 2"));  // Output: 20.0
  print(multiStepCalculator("(10 + 5) * 2"));  // Output: 30.0
}
