void quickSort(List<int> list, int low, int high) {
  if (low < high) {
    int pi = partition(list, low, high);

    quickSort(list, low, pi - 1);
    quickSort(list, pi + 1, high);
  }
}

int partition(List<int> list, int low, int high) {
  int pivot = list[high];
  int i = low - 1;

  for (int j = low; j <= high - 1; j++) {
    if (list[j] <= pivot) {
      i = i + 1;
      swap(list, i, j);
    }
  }

  swap(list, i + 1, high);
  return i + 1;
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

List<int> sortList(List<int> list) {
  quickSort(list, 0, list.length - 1);
  return list;
}

void main() {
  // Create a list of integers to sort
  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5];

  // Sort the list using quickSort
  numbers = sortList(numbers);

  // Print the sorted list
  print(numbers);
}

