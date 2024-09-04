// sorting_algorithms.dart

import 'dart:core';

// Bubble Sort implementation
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
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
  if (list.length <= 1) {
    return list;
  }
  int pivot = list[list.length ~/ 2];
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  for (int element in list) {
    if (element < pivot) {
      less.add(element);
    } else if (element == pivot) {
      equal.add(element);
    } else {
      greater.add(element);
    }
  }
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

void main() {
  List<int> numbers = [9, 3, 5, 2, 8, 1, 4, 7, 6];
  List<int> emptyList = []; // Example of using an empty list
  List<int> duplicateElements = [
    3,
    3,
    3,
    3,
    3
  ]; // Example of using a list with duplicate elements

  // Bubble Sort
  print("Original list: $numbers");
  Stopwatch stopwatch = Stopwatch()..start();
  List<int> bubbleSorted = bubbleSort(List.from(numbers));
  stopwatch.stop();
  print("Bubble Sorted list: $bubbleSorted");
  print("Bubble Sort took: ${stopwatch.elapsedMilliseconds} milliseconds");

  // Quick Sort
  stopwatch.reset();
  stopwatch.start();
  List<int> quickSorted = quickSort(List.from(numbers));
  stopwatch.stop();
  print("Quick Sorted list: $quickSorted");
  print("Quick Sort took: ${stopwatch.elapsedMilliseconds} milliseconds");

  // Testing empty list
  print("Bubble Sorted empty list: ${bubbleSort(emptyList)}");
  print("Quick Sorted empty list: ${quickSort(emptyList)}");

  // Testing list with duplicate elements
  print("Bubble Sorted list with duplicates: ${bubbleSort(duplicateElements)}");
  print("Quick Sorted list with duplicates: ${quickSort(duplicateElements)}");
}
