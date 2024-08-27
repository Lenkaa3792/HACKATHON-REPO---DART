import 'dart:io'; //Importing the I/O library to use stdin for user input

//Function that performs basic arithmetic operations between two numbers
double? basicCalculator(double num1, double num2, String operator){
  switch(operator){
    case '+':
    return num1 +num2; // Addition
    case '-':
    return num1 - num2; // Subtraction
    case '*':
    return num1 * num2; // Multiplicstion
    case '/':
    if(num2 != 0){
      return num1 / num2; // Division, with check to prevent division by zero
    }else{
      print('Error: Division by zero');
      return null; //Return null if division by zero occurs
    }
    case '%':
    if(num2 != 0){
      return num1 % num2; //Modulus operation, with the check to prevent division by zero.
    } else {
      print('Error: Division by zero');
      return null; //Return null if division by zero occurs
    }
    default:
    print('Error: Unsupported operator');
    return null; //Return null if division by zero occurs
  }
}

// Function to handle multi-step arithmetic operations provided as a string expression
double? extendedCalculator(String expression) {
  try {
    // Split the expression into tokens by spaces (e.g., "10 + 7 * 2" becomes ["10", "+", "7", "*", "2"])
    List<String> tokens = expression.split(' ');
    
    // Initialize result with the first number
    double result = double.parse(tokens[0]);

    // Iterate over the tokens, performing operations sequentially
    for (int i = 1; i < tokens.length - 1; i += 2) {
      String operator = tokens[i]; // Get the operator
      double num = double.parse(tokens[i + 1]); // Get the next number

      // Perform the operation using the basicCalculator function
      result = basicCalculator(result, num, operator)!;
    }

    return result; // Return the final result
  } catch (e) {
    print('Error: Invalid expression');
    return null; // Return null if the expression is invalid or an error occurs
  }
}
void main() {
  // Prompt the user to enter a mathematical expression
  print('Enter the operation you want to perform (e.g., 10 + 7 * 2):');
  String? userInput = stdin.readLineSync(); // Read the user input

  // Check if the input is valid (not null or empty)
  if (userInput != null && userInput.isNotEmpty) {
    // Pass the user input to the extendedCalculator function
    double? result = extendedCalculator(userInput);
    if (result != null) {
      print('Result: $result'); // Print the result if calculation is successful
    }
  } else {
    print('Invalid input'); // Print an error message if the input is invalid
  }
}