import 'dart:io';

int sumOfNaturalNumber(int n) {
  int result = 0;

  for (int i = 1; i <= n; i++) {
    result = result + i;
  }

  return result;
}

void main() {
  print("Enter a number to calculate the sum of the first n natural numbers:");
  int? num = int.parse(stdin.readLineSync()!);

  print("The sum of all natural numbers till $num is ${sumOfNaturalNumber(num)}.");
}
