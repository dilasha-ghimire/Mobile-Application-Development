// Create a program to check whether a string is palindrome or not.

import 'dart:io';

void main() {
  stdout.write("Give a word: ");
  String input = stdin.readLineSync()!.toLowerCase();
  String reversed = input.split('').reversed.join('');
  if (input == reversed) {
    print("The word is a palindrome.");
  } else {
    print("The word is not a palindrome.");
  }
}
