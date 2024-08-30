

//  Task 2.   Sorting Algorithm Implementation

//Quick Sort Algorithm Implementation
List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;  // Base case: A list of zero or one element is already sorted.

  int pivot = list[list.length ~/ 2];  // Choose a pivot element (here we use the middle element).

  // Partitioning the list into elements less than, equal to, and greater than the pivot.
  List<int> less = list.where((element) => element < pivot).toList();
  List<int> equal = list.where((element) => element == pivot).toList();
  List<int> greater = list.where((element) => element > pivot).toList();

  // Recursively sort 'less' and 'greater' lists and concatenate the results.
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}


//Merge Sort Algorithm Implementation
List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;  // Base case: A list of zero or one element is already sorted.

  int mid = list.length ~/ 2;  // Find the middle index to divide the list into two halves.
  List<int> left = list.sublist(0, mid);  // First half
  List<int> right = list.sublist(mid);  // Second half

  // Recursively split and merge the sorted halves.
  return merge(mergeSort(left), mergeSort(right));
}

// Helper function to merge two sorted lists into one sorted list.
List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  // Merge the two lists by comparing elements one by one.
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // Add remaining elements from both halves (if any).
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  
  return result;
}


//bubble sort algorithm implementation
List<int> bubbleSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // Swap the elements
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}


//Function to compare the Performance of the Algorithms
void compareSortingAlgorithms(List<int> list) {
  // Create a Stopwatch to measure execution time.
  Stopwatch stopwatch = Stopwatch();

  // Measure Quick Sort time
  stopwatch.start();
  List<int> quickSorted = quickSort(List.from(list));  // Use List.from() to create a copy of the original list.
  print('Quick Sort List: $quickSorted');
  stopwatch.stop();
  print('Quick Sort executed in ${stopwatch.elapsedMicroseconds} microseconds.');

  // Measure Merge Sort time
  stopwatch.reset();
  stopwatch.start();
  List<int> mergeSorted = mergeSort(List.from(list));  // Use List.from() to create a copy of the original list.
  print('Merge Sort List: $mergeSorted');
  stopwatch.stop();
  print('Merge Sort executed in ${stopwatch.elapsedMicroseconds} microseconds.');

    // Measure Bubble Sort time
  stopwatch.reset();
  stopwatch.start();
  List<int> bubbleSorted = bubbleSort(List.from(list));  // Use List.from() to create a copy of the original list.
  print('Bubble Sort List: $bubbleSorted');
  stopwatch.stop();
  print('Bubble Sort executed in ${stopwatch.elapsedMicroseconds} microseconds.');

}

void main() {
  // Test list
  List<int> list = [34, 7, 23, 32, 5, 62, 32, 4, 22, 11, 90, 67];

  // Perform sorting and compare performance
  compareSortingAlgorithms(list);
}

