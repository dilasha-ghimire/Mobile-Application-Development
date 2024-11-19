int multiply(int first, int second,
    [int third = 0, int fourth = 0, int fifth = 0]) {
  return first * second * third * fourth * fifth;
}

void main() {
  int result = multiply(1, 2, 3);
  print(result);
}
