// Function to merge two subarrays of the list
void merge(List list, int leftIndex, int middleIndex, int rightIndex) {
  // Calculate the sizes of the two subarrays
  int leftSize = middleIndex - leftIndex + 1;
  int rightSize = rightIndex - middleIndex;

  // Create temporary lists to hold the subarrays
  List leftList = List.filled(leftSize, null);
  List rightList = List.filled(rightSize, null);

  // Copy data to temporary lists
  for (int i = 0; i < leftSize; i++) leftList[i] = list[leftIndex + i];
  for (int j = 0; j < rightSize; j++) rightList[j] = list[middleIndex + j + 1];

  // Initial indexes for the subarrays and the merged array
  int i = 0, j = 0;
  int k = leftIndex;

  // Merge the temporary lists back into the original list
  while (i < leftSize && j < rightSize) {
    if (leftList[i] <= rightList[j]) {
      list[k] = leftList[i];
      i++;
    } else {
      list[k] = rightList[j];
      j++;
    }
    k++;
  }

  // Copy any remaining elements of leftList, if any
  while (i < leftSize) {
    list[k] = leftList[i];
    i++;
    k++;
  }

  // Copy any remaining elements of rightList, if any
  while (j < rightSize) {
    list[k] = rightList[j];
    j++;
    k++;
  }
}

// Function to perform Merge Sort on a list of integers
void mergeSort(List list, int leftIndex, int rightIndex) {
  if (leftIndex < rightIndex) {
    // Find the middle point to divide the list into two halves
    int middleIndex = (rightIndex + leftIndex) ~/ 2;

    // Recursively sort the first and second halves
    mergeSort(list, leftIndex, middleIndex);
    mergeSort(list, middleIndex + 1, rightIndex);

    // Merge the sorted halves
    merge(list, leftIndex, middleIndex, rightIndex);
  }
}

void main() {
  List<int> numbers = [34, 7, 23, 32, 5, 62]; // List of numbers to be sorted
  mergeSort(numbers, 0, numbers.length - 1); // Call mergeSort on the entire list
  print('Merge Sort: $numbers'); // Print the sorted list
}
