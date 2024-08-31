
//Quick Sort Algorithm

// Helper function to partition the list and return the pivot index
int partition(List<dynamic> list, int low, int high) {
  if (list.length == 0) return 0;
  int pivot = list[high];  // Choose the last element as the pivot
  int i = low - 1;         // Index of smaller element

  for (int j = low; j < high; j++) {
    if (list[j] <= pivot) {
      i++;
      swap(list, i, j);   // Swap elements smaller than pivot to the left
    }
  }  
  swap(list, i+1, high);   // Swap the pivot element to its correct position
  return i+1;              // Return the pivot index
}


// Helper function to swap two elements in the list
void swap(List list, int i, int j) {
  int temp = list[i]; 
  list[i] = list[j];
  list[j] = temp;
}

// Function to perform Quick Sort on a list of elements
void quickSort(List list, int low, int high) {
  if (low < high) {
    // Partition the list and get the pivot index
    int pi = partition(list, low, high);

    // Recursively sort the elements before and after the pivot
    quickSort(list, low, pi-1);
    quickSort(list, pi+1, high);
  }
}


void main() {
  List<int> numbers = [34, 7, 23, 32, 5, 62, 9, 11, 17, 44]; // List of numbers to be sorted
  quickSort(numbers, 0, numbers.length - 1); // Call quickSort on the entire list
  print('Quick Sort: $numbers'); // Print the sorted list
}