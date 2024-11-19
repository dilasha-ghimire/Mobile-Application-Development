// Create a program that returns a list that contains only the elements that are
// common between the two lists (without duplicates).

/* void main() {
  // Set removes duplicates by themselves.
  Set<int> a = {1, 1, 2, 3, 4, 4, 5};
  print(a);
  Set<int> b = {2, 4, 6, 8, 10};
  print(b);

  Set<int> commonElements = a.intersection(b);
  print("Common elements between the two lists: $commonElements");
} */

// with user input

import 'dart:io';

void main() {
  // Get user input for the first list
  print("Enter the first list of numbers separated by spaces:");
  String input1 = stdin.readLineSync() ?? '';
  Set<int> a = input1.split(' ').map(int.parse).toSet();
  
  // Get user input for the second list
  print("Enter the second list of numbers separated by spaces:");
  String input2 = stdin.readLineSync() ?? '';
  Set<int> b = input2.split(' ').map(int.parse).toSet();
  
  // Find the common elements between the two sets
  Set<int> commonElements = a.intersection(b);
  
  // Print the common elements
  print("Common elements between the two lists: $commonElements");
}
