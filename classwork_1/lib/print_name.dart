import 'dart:io';

String printName100Times(String name) {
  String result = '';
  for (int i = 0; i < 100; i++) {
    result += '$name\n';
  }
  return result;
}

void main() {
  print("Enter your name: ");
  String name = stdin.readLineSync()!;
  print(printName100Times(name));
}
