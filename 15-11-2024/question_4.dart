// Write a program to calculate the sum of natural numbers until 'n'.

void main() {
  int n = 100;
  int result = 0;
  for (int i = 1; i <= n; i++) {
    // i = 1; natural number
    result = result + i;
  }
  print(result);
}

// with user input

import 'dart:io';

void main() {
  // Ask the user to input the number 'n'
  print("Enter a number to calculate the sum of the first n natural numbers:");
  String? input = stdin.readLineSync();
  
  // Convert the input to an integer
  int n = int.parse(input ?? '0');
  
  int result = 0;
  
  // Calculate the sum of the first 'n' natural numbers
  for (int i = 1; i <= n; i++) {
    result = result + i;
  }
  
  // Print the result
  print("The sum of the first $n natural numbers is: $result");
}
