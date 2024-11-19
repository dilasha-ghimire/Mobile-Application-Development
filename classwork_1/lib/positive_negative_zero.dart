import 'dart:io';

String checkPositiveNegativeZero(int number) {
  if (number > 0) {
    return "The number is positive.";
  }
  if (number < 0) {
    return "The number is negative.";
  }
  return "The number is zero.";
}

void main() {
  print("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);
  print(checkPositiveNegativeZero(number));
}
