import 'dart:io';

double simpleCalculator(String operator, double num1, double num2) {
  if (operator == '+') {
    return num1 + num2;
  } 
  else if (operator == '-') {
    return num1 - num2;
  } 
  else if (operator == '*') {
    return num1 * num2;
  } 
  else if (operator == '/') {
    return num1 / num2;
  } 
  else {
    return 0; 
  }
}

void main() {
  print("Enter an operator (+, -, *, /): ");
  String operator = stdin.readLineSync()!;

  print("Enter the first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter the second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  double result = simpleCalculator(operator, num1, num2);
  print("Result: $result");
}
