import 'dart:io';

String checkOddEven(int num) {
  if (num % 2 == 0) {
    return "The number is even.";
  } 
  else {
    return "The number is odd.";
  }
}

void main() {
  print("Enter a number: ");
  int? num = int.parse(stdin.readLineSync()!);
  print(checkOddEven(num));
}
