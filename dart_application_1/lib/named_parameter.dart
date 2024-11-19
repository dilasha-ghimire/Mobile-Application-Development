int add({
  required int? first,
  required int? second,
  int? third,
  int? fourth,
  int? fifth,
}) {
  return first! + second! + (third ?? 0) + (fourth ?? 0) + (fifth ?? 0);
}

void main() {
  print(add(first: 1, second: 2, third: 3));
}