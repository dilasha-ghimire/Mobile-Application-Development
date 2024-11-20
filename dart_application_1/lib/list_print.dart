import 'dart:io';

void printList(List<int> arr) {
  print("Elements in list: ");
  for (var i in arr) {
    print(i);
  }
  print(arr);
}

void countEvenNumber(List<int> arr) {
  int count = 0;
  for (int i in arr) {
    if (i % 2 == 0) {
      count++;
    }
  }

  print("number of even numbers are: $count");
}

void linearSearchOnList(List<int> arr, int n) {
  bool found = false;
  for (int i in arr) {
    if (i == n) {
      found = true;
      break;
    }
  }
  if (found) {
    print("Number $n is found.");
  } 
  else {
    print("Number $n is not found.");
  }
}

void main() {
  List<int> lstInt = [];

  for (int i = 0; i < 5; i++) {
    print("Enter a number: ");
    String? input = stdin.readLineSync();
    int n = int.parse(input ?? '0');
    lstInt.add(n);
  }

  printList(lstInt);
  countEvenNumber(lstInt);

  print("Find number you want to search: ");
  String? search = stdin.readLineSync();
  int number = int.parse(search ?? '0');
  linearSearchOnList(lstInt, number);
}
