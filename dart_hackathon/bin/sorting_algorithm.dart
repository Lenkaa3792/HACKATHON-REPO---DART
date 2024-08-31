import 'dart:math';
import 'dart:core';

List<int> quickSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int pivot = arr[Random().nextInt(arr.length)];
  List<int> left = [];
  List<int> middle = [];
  List<int> right = [];

  for (int x in arr) {
    if (x < pivot) {
      left.add(x);
    } else if (x == pivot) {
      middle.add(x);
    } else {
      right.add(x);
    }
  }

  return [...quickSort(left), ...middle, ...quickSort(right)];
}

List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  List<int> leftHalf = arr.sublist(0, mid);
  List<int> rightHalf = arr.sublist(mid);

  return _merge(mergeSort(leftHalf), mergeSort(rightHalf));
}

List<int> _merge(List<int> left, List<int> right) {
  List<int> merged = [];
  int leftIndex = 0;
  int rightIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] <= right[rightIndex]) {
      merged.add(left[leftIndex]);
      leftIndex++;
    } else {
      merged.add(right[rightIndex]);
      rightIndex++;
    }
  }

  merged.addAll(left.sublist(leftIndex));
  merged.addAll(right.sublist(rightIndex));

  return merged;
}

Duration measureExecutionTime(Function func, List<int> input) {
  Stopwatch stopwatch = Stopwatch()..start();
  func(input);
  stopwatch.stop();
  return stopwatch.elapsed;
}

void main() {
  const int listSize = 100000;
  List<int> numbers = List.generate(listSize, (_) => Random().nextInt(10000));

  Duration quickSortTime = measureExecutionTime(quickSort, numbers);
  Duration mergeSortTime = measureExecutionTime(mergeSort, numbers);

  print('Quick Sort time: ${quickSortTime.inMilliseconds} ms');
  print('Merge Sort time: ${mergeSortTime.inMilliseconds} ms');

  if (quickSort(numbers) == mergeSort(numbers)) {
    print('Both algorithms produced the same sorted result.');
  } else {
    print('Warning: Different sorted results from the two algorithms.');
  }
}
