import 'dart:math';

// Bubble Sort implementation
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // Swap elements
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

// Quick Sort implementation
List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;

  int pivot = list[list.length ~/ 2];
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  for (var element in list) {
    if (element < pivot) {
      less.add(element);
    } else if (element == pivot) {
      equal.add(element);
    } else {
      greater.add(element);
    }
  }

  return quickSort(less) + equal + quickSort(greater);
}

// Function to measure the execution time of sorting algorithms
void compareSortingAlgorithms(List<int> list) {
  // Clone the list for independent sorting
  List<int> bubbleSortList = List.from(list);
  List<int> quickSortList = List.from(list);

  // Measure Bubble Sort time
  Stopwatch stopwatch = Stopwatch()..start();
  bubbleSort(bubbleSortList);
  stopwatch.stop();
  print('Bubble Sort executed in ${stopwatch.elapsedMicroseconds} microseconds');

  // Measure Quick Sort time
  stopwatch.reset();
  stopwatch.start();
  quickSort(quickSortList);
  stopwatch.stop();
  print('Quick Sort executed in ${stopwatch.elapsedMicroseconds} microseconds');
}

void main() {
  List<int> unsortedList = List.generate(1000, (_) => Random().nextInt(10000));

  // Compare performance
  compareSortingAlgorithms(unsortedList);

  // Print sorted lists
  print("Bubble Sorted List: ${bubbleSort(unsortedList)}");
  print("Quick Sorted List: ${quickSort(unsortedList)}");
}