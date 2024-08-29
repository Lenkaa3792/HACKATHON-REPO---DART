import 'dart:io';
import 'dart:collection';

/// Evaluates a mathematical expression with multi-step operations.
///
/// [expression] The mathematical expression as a string (e.g., "3 + 5 * 2").
double evaluateExpression(String expression) {
  List<String> tokens = _tokenize(expression);
  List<String> postfix = _infixToPostfix(tokens);
  return _evaluatePostfix(postfix);
}

/// Tokenizes the input expression into numbers and operators.
///
/// [expression] The mathematical expression as a string.
/// 
/// Returns:
/// - A list of tokens (numbers and operators).
List<String> _tokenize(String expression) {
  RegExp exp = RegExp(r'\d+|[+\-*/%()]');
  return exp.allMatches(expression).map((match) => match.group(0)!).toList();
}

/// Converts an infix expression (e.g., "3 + 5") to postfix notation (e.g., "3 5 +").
///
/// [tokens] The list of tokens (numbers and operators) in infix notation.
/// 
/// Returns:
/// - A list of tokens in postfix notation.
List<String> _infixToPostfix(List<String> tokens) {
  final precedence = {'+': 1, '-': 1, '*': 2, '/': 2, '%': 2};
  final operators = Queue<String>();
  final output = <String>[];

  for (String token in tokens) {
    if (RegExp(r'\d').hasMatch(token)) {
      output.add(token);
    } else if (precedence.containsKey(token)) {
      while (operators.isNotEmpty &&
             precedence[operators.last]! >= precedence[token]!) {
        output.add(operators.removeLast());
      }
      operators.addLast(token);
    } else if (token == '(') {
      operators.addLast(token);
    } else if (token == ')') {
      while (operators.isNotEmpty && operators.last != '(') {
        output.add(operators.removeLast());
      }
      if (operators.isEmpty || operators.removeLast() != '(') {
        throw ArgumentError("Mismatched parentheses.");
      }
    }
  }

  while (operators.isNotEmpty) {
    String op = operators.removeLast();
    if (op == '(' || op == ')') {
      throw ArgumentError("Mismatched parentheses.");
    }
    output.add(op);
  }

  return output;
}

/// Evaluates a postfix expression.
///
/// [postfix] The list of tokens in postfix notation.
/// 
/// Returns:
/// - The result of the evaluated expression.
double _evaluatePostfix(List<String> postfix) {
  final stack = Queue<double>();

  for (String token in postfix) {
    if (RegExp(r'\d').hasMatch(token)) {
      stack.addLast(double.parse(token));
    } else {
      double b = stack.removeLast();
      double a = stack.removeLast();
      switch (token) {
        case '+':
          stack.addLast(a + b);
          break;
        case '-':
          stack.addLast(a - b);
          break;
        case '*':
          stack.addLast(a * b);
          break;
        case '/':
          if (b == 0) {
            throw DivisionByZeroException("Cannot divide by zero.");
          }
          stack.addLast(a / b);
          break;
        case '%':
          if (b == 0) {
            throw DivisionByZeroException("Cannot modulo by zero.");
          }
          stack.addLast(a % b);
          break;
        default:
          throw ArgumentError("Invalid operator: $token");
      }
    }
  }

  return stack.single;
}

/// Custom exception for division by zero.
class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException(this.message);

  @override
  String toString() => "DivisionByZeroException: $message";
}

void main() {
  print("Enter a mathematical expression (e.g., 4 / 2 OR 3 + 5 * 2):");
  String? expression = stdin.readLineSync();

  try {
    if (expression != null && expression.isNotEmpty) {
      double result = evaluateExpression(expression);
      print('Result: $result');
    } else {
      print("Invalid input. Please provide a valid expression.");
    }
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}