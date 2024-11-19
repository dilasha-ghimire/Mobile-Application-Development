// Create a program that asks the user to enter their name and age,
// then prints out a message that tells how many years they have to be 100 years old.

import 'dart:io';

void main() {
  print("What is your name?");
  String? name = stdin.readLineSync();

  print("How old are you?");
  int? age = int.parse(stdin.readLineSync()!);

  print("Your name is $name.\nYou have ${100 - age} years to be 100 years old.");
}
