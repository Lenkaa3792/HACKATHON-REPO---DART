
class CalculationError implements Exception {
  final String message;
  CalculationError(this.message);
  @override
  String toString() => 'CalculationError: $message';
}


///---------  This function below takes a list of dynamic inputs representing the calculation steps and returns the final result as a double.

double calculate(List<dynamic> input) {
  if (input.isEmpty) {
    throw CalculationError('Empty input');
  }

  double result = 0;
  String currentOperator = '+';


///-----------Input Processing: The function iterates through the input list, alternating between numbers and operators
  for (int i = 0; i < input.length; i++) {
    if (i % 2 == 0) {
      // Expecting a number
      if (input[i] is! num) {
        throw CalculationError('Expected a number at position $i, got ${input[i]}');
      }
      double number = input[i].toDouble();

      switch (currentOperator) {
        case '+':
          result += number;
          break;
        case '-':
          result -= number;
          break;
        case '*':
          result *= number;
          break;
        case '/':
          if (number == 0) {
            throw CalculationError('Division by zero');
          }
          result /= number;
          break;
        case '%':
          if (number == 0) {
            throw CalculationError('Modulo by zero');
          }
          result %= number;
          break;
        default:
          throw CalculationError('Unknown operator: $currentOperator');
      }
    } else {
      //---------- Here we are expecting an operator
      if (input[i] is! String || !['+', '-', '*', '/', '%'].contains(input[i])) {
        throw CalculationError('Expected an operator at position $i, got ${input[i]}');
      }
      currentOperator = input[i];
    }
  }

  return result;
}

// Main application
void main() {
  // Test cases
  print(calculate([5, '+', 3])); // 8.0
  print(calculate([100, '-', 20])); // 80.0
  print(calculate([3, '*', 7])); // 21.0
  print(calculate([15, '/', 3])); // 5.0
  print(calculate([21, '%', 5])); // 1.0
  
  // Multi-step operations
  print(calculate([5, '+', 3, '*', 2, '-', 4])); // 9.0
  print(calculate([10, '/', 2, '+', 3, '*', 4, '-', 6])); // 17.0
  


  //---------------- Error handling --------------------

  //---CalculationError: Division by zero
  try {
    print(calculate([12, '/', 0]));
  } catch (e) {
    print(e);
  }
  
  // ------- CalculationError: Modulus by zero
  try {
    print(calculate([10, '%', 0]));
  } catch (e) {
    print(e); 
  }
  
  //------ CalculationError: Unknown operator: &
  try {
    print(calculate([5, '&', 3]));
  } catch (e) {
    print(e); 
  }
  
  //---- CalculationError: Expected a number at position 2, got ten
  try {
    print(calculate([5, '+', 'ten']));
  } catch (e) {
    print(e); 
  }
  
  //------ CalculationError: Empty input
  try {
    print(calculate([]));
  } catch (e) {
    print(e);
  }
}
