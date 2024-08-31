import 'dart:io';
import 'dart:math';

// Quick Sort Algorithm
List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;

  final pivot = list[list.length ~/ 2];
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  for (var element in list) {
    if (element < pivot) {
      less.add(element);
    } else if (element > pivot) {
      greater.add(element);
    } else {
      equal.add(element);
    }
  }

  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

///--------------------- Bubble Sort Algorithm ------------
List<int> bubbleSort(List<int> list) {
  List<int> sortedList = List.from(list);
  int n = sortedList.length;
  bool swapped;

  for (int i = 0; i < n - 1; i++) {
    swapped = false;
    for (int j = 0; j < n - i - 1; j++) {
      if (sortedList[j] > sortedList[j + 1]) {
        //Here we are swapping elements
        int temp = sortedList[j];
        sortedList[j] = sortedList[j + 1];
        sortedList[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) break;
  }

  return sortedList;
}

//------- Comparing the two ---------
void compareAlgorithms(List<int> numbers) {
  print('\n Original list: $numbers');

  // Quick Sort
  Stopwatch stopwatch = Stopwatch()..start();
  List<int> quickSortResult = quickSort(numbers);
  stopwatch.stop();
  print('\nQuick Sort result: $quickSortResult');
  print('Quick Sort duration: ${stopwatch.elapsedMicroseconds} microseconds');

  // Bubble Sort
  stopwatch.reset();
  stopwatch.start();
  List<int> bubbleSortResult = bubbleSort(numbers);
  stopwatch.stop();
  print('\nBubble Sort result: $bubbleSortResult');
  print('Bubble Sort duration: ${stopwatch.elapsedMicroseconds} microseconds');

  //------- Checking the sorting was done correctly
  print('\nQuick Sort is correctly sorted: ${isSorted(quickSortResult)}');
  print('Bubble Sort is correctly sorted: ${isSorted(bubbleSortResult)}');
}

// check if List is sorted. 
bool isSorted(List<int> list) {
  for (int i = 1; i < list.length; i++) {
    if (list[i] < list[i - 1]) return false;
  }
  return true;
}

// Taking user input
List<int> userInput() {
  List<int> numbers = [];
  print('Enter integers to sort OR non-interges to terminate the program.');
  
  while (true) {
    stdout.write('Enter an integer: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) break;

    try {
      int number = int.parse(input);
      numbers.add(number);
    } catch (e) {
      print('Non-integer input detected. Stopping input.');
      break;
    }
  }
  return numbers;
}

//------- Main Function --------
void main() {
  List<int> userNumbers = userInput();
  if (userNumbers.isEmpty) {
    print('No numbers entered. Using a random list instead.');
    final random = Random();
    userNumbers = List.generate(10, (_) => random.nextInt(100));
  }

  compareAlgorithms(userNumbers);
}


/*
------------- POINTS TO NOTE ----------------------------

1.Quick Sort Optimization: The optimized version of -quickSort- uses a single loop to partition the list into `less`, `equal`, and `greater`.
- This reduces the number of times the list is iterated over, which can improve performance.

2. Bubble Sort Optimization: The improved -bubbleSort-  uses a boolean flag (swapped) to detect if any swaps were made during an iteration.
- If no swaps were made, the list is already sorted –
-  and the function can terminate early, saving unnecessary iterations.
3. Stopwatch Usage: Using -Stopwatch-  allows for more accurate performance measurement, especially in microseconds.

4. User Input Handling: The -userInput- function provides clearer prompts and messages. 
- It also immediately prompts the user for more input, enhancing the overall flow.
5. General Error Handling: Provides feedback when a non-integer input is detected and stops input appropriately, enhancing user experience.

*/
