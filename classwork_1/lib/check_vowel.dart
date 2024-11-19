import 'dart:io';

String checkVowelConsonant(String? char) {
  if (char?.toLowerCase() == "a" ||
      char?.toLowerCase() == "e" ||
      char?.toLowerCase() == "i" ||
      char?.toLowerCase() == "o" ||
      char?.toLowerCase() == "u") {
    return "Vowel";
  } 
  else {
    return "Consonant";
  }
}

void main() {
  print("Enter an alphabet: ");
  String? char = stdin.readLineSync();
  print(checkVowelConsonant(char));
}
