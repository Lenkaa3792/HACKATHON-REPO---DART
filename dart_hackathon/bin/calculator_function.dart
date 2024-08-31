import 'package:math_expressions/math_expressions.dart';

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
        throw Exception('Division by zero');
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw Exception('Modulus by zero');
      }
      return num1 % num2;
    default:
      throw Exception('Invalid operator');
  }
}

double calculateExpression(String expression) {
  try {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  } catch (e) {
    throw Exception('Error parsing expression: $e');
  }
}

void main() {
  // Basic operations
  print(calculate(10, 5, '+')); // Output: 15.0
  print(calculate(10, 5, '-')); // Output: 5.0
  print(calculate(10, 5, '*')); // Output: 50.0
  print(calculate(10, 5, '/')); // Output: 2.0
  print(calculate(10, 5, '%')); // Output: 0.0

  // Error handling
  try {
    print(calculate(10, 0, '/'));
  } catch (e) {
    print(e); // Output: Division by zero
  }

  // Multi-step operations
  print(calculateExpression("10 + 5 * 2")); // Output: 20.0
  print(calculateExpression("(10 + 5) * 2")); // Output: 30.0
}
