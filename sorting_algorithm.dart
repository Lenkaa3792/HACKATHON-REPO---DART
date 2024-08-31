// Function to perform Bubble Sort on a list of integers
List<int> bubbleSort(List<int> list) {
  int n = list.length; // Get the length of the list
  // Outer loop for each element in the list
  for (int i = 0; i < n - 1; i++) {
    // Inner loop to compare adjacent elements
    for (int j = 0; j < n - i - 1; j++) {
      // Check if the current element is greater than the next element
      if (list[j] > list[j + 1]) {
        // Swap the elements if they are in the wrong order
        int temp = list[j]; // Temporarily store the current element
        list[j] = list[j + 1]; // Move the next element to the current position
        list[j + 1] = temp; // Place the stored element in the next position
      }
    }
  }
  return list; // Return the sorted list
}

// Function to perform Quick Sort on a list of integers
List<int> quickSort(List<int> list) {
  // Base case: a list with 0 or 1 elements is already sorted
  if (list.length <= 1) {
    return list; // Return the list as is
  }

  // Choose a pivot element from the middle of the list
  int pivot = list[list.length ~/ 2];
  // Initialize lists to hold elements less than, equal to, and greater than the pivot
  List<int> less = []; // Elements less than the pivot
  List<int> equal = []; // Elements equal to the pivot
  List<int> greater = []; // Elements greater than the pivot

  // Partition the list into less, equal, and greater lists based on the pivot
  for (int num in list) {
    if (num < pivot) {
      less.add(num); // Add to less if the number is smaller than the pivot
    } else if (num > pivot) {
      greater.add(num); // Add to greater if the number is larger than the pivot
    } else {
      equal.add(num); // Add to equal if the number is the same as the pivot
    }
  }

  // Combine the sorted less, equal, and greater lists
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}
