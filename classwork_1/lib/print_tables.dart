void printTables(int start, int end) {
  for (int i = start; i <= end; i++) {
    print("Table of $i:");
    for (int j = 1; j <= 10; j++) {
      print("$i * $j = ${i * j}");
    }
    print("");
  }
}

void main() {
  printTables(1, 9);
}
