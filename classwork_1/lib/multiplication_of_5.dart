int multiplicationOf5(int number) {
  return number * 5;
}

void main() {
  print("Tables of 5:");
  for (int i = 1; i <= 10; i++) {
    print(" $i * 5 = ${multiplicationOf5(i)}");
  }
}
