import 'dart:core';
import 'dart:io';
import 'dart:math';

/// Bubble Sort Algorithm
/// Sorts a list of integers using the Bubble Sort algorithm.
/// [list] The list of integers to be sorted.
/// Returns:
/// - The sorted list of integers.
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // Swap if elements are in the wrong order
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

/// Quick Sort Algorithm
/// Sorts a list of integers using the Quick Sort algorithm.
/// [list] The list of integers to be sorted.
/// Returns:
/// - The sorted list of integers.
List<int> quickSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  int pivotIndex = list.length ~/ 2;
  int pivot = list[pivotIndex];
  
  List<int> less = [];
  List<int> greater = [];

  for (int i = 0; i < list.length; i++) {
    if (i == pivotIndex) continue;
    if (list[i] <= pivot) {
      less.add(list[i]);
    } else {
      greater.add(list[i]);
    }
  }

  return [...quickSort(less), pivot, ...quickSort(greater)];
}

void main() {
  // Example list
  List<int> list = [34, 7, 23, 32, 5, 62, 32, 43, 1, 0];

  // Bubble Sort
  Stopwatch stopwatch = Stopwatch()..start();
  List<int> bubbleSortedList = bubbleSort(List.from(list));
  stopwatch.stop();
  print('Bubble Sort: ${bubbleSortedList}');
  print('Bubble Sort Execution Time: ${stopwatch.elapsedMilliseconds} ms');

  // Quick Sort
  stopwatch.reset();
  stopwatch.start();
  List<int> quickSortedList = quickSort(List.from(list));
  stopwatch.stop();
  print('Quick Sort: ${quickSortedList}');
  print('Quick Sort Execution Time: ${stopwatch.elapsedMilliseconds} ms');
}