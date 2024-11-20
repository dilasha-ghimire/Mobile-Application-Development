import 'dart:io';

double menuDrivenProgram(String operator, double num1, double num2) {
  switch (operator) {
    case "+":
      return num1 + num2;
    case "-":
      return num1 - num2;
    case "*":
      return num1 * num2;
    default:
      throw ArgumentError("Invalid operator. Please enter one of +, -, *");
  }
}

void main() {
  String continueChoice = "";
  
  do {
    print("Enter your choice from the menu:\n 1. Addition (Enter +)\n 2. Subtraction (Enter -)\n 3. Multiply (Enter *)");
    String operator = stdin.readLineSync()!;

    print("Enter the first number:");
    double num1 = double.parse(stdin.readLineSync()!);

    print("Enter the second number:");
    double num2 = double.parse(stdin.readLineSync()!);

    double result = menuDrivenProgram(operator, num1, num2);
    print("Result: $result");

    print("Do you want to perform another operation? (yes/no):");
    continueChoice = stdin.readLineSync()!.toLowerCase();
  } 
  while (continueChoice == "yes");

  print("Thank you for using the program. Goodbye!");
}
