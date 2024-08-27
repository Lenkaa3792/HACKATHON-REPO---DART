//Quick Sort 
List<int> quickSort(List<int> list) {
  if(list.length <= 1){
    return list;
  }
  int pivot = list[list.length ~/ 2];
  List<int> left = [];
  List<int> right = [];
  List<int> equal = [];

  for(var num in list){
    if (num < pivot){
      left.add(num);
    }else if(num > pivot){
      right.add(num);
    }else{
      equal.add(num);
    }
  }
  return quickSort(left) + equal + quickSort(right);
}
/*
Quick Sort is a divide and conquer algorithm that picks a pivot and partitions the list into three sublists 
(less than, equal to, and greater than the pivot). It then recursively sorts the sublists.
Average time complexity is O(n log n) and O(n²) on worst case.
*/

// Bubble Sort 
List <int> bubbleSort(List<int> list){
  int n = list.length;
  for(int i = 0; i < n - 1; i++){
    for(int j = 0; j < n - i - 1; j++){
      if (list[j] > list[j+1]){
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}
/*
Bubble Sort is a simple comparison-based algorithm that repeatedly steps through the list, compares
adjacent elements, and swaps them if they are in the wrong order.
Time Complexity is O(n²)
*/

void main(){
  List<int> list1 = [23, 87, 14, 68, 45, 92, 11, 7, 56, 34, 78, 39, 82, 16, 4];
  List<int> list2 = List.from(list1); // Create a copy for the second sort

  // Measure Quick Sort time using StopWatch
  Stopwatch stopwatchQuickSort = Stopwatch()..start();
  List<int> quickSorted = quickSort(list1);
  stopwatchQuickSort.stop();
  print('Quick Sort: ${stopwatchQuickSort.elapsedMicroseconds} microseconds');
  print('Quick Sorted List: $quickSorted');

  // Measure Bubble Sort timr using StopWatch
  Stopwatch stopwatchBubbleSort = Stopwatch()..start();
  List<int> bubbleSorted = bubbleSort(list2);
  stopwatchBubbleSort.stop();
  print('Bubble Sort: ${stopwatchBubbleSort.elapsedMicroseconds} microseconds');
  print('Bubble Sorted List: $bubbleSorted');
}