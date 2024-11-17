// Write a program that prints all numbers from a list that are less than 5.

void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 4, 34, 2, 55, 89];
  for (var i in a) {
    if (i < 5) {
      print(i);
    }
  }
}

// with user input

import 'dart:io';

void main() {
  // Get user input as a string
  print("Enter a list of numbers separated by spaces:");
  String input = stdin.readLineSync() ?? '';
  
  // Convert the input string to a list of integers
  List<int> a = input.split(' ').map(int.parse).toList();
  
  // Loop through the list and print numbers less than 5
  for (var i in a) {
    if (i < 5) {
      print(i);
    }
  }
}