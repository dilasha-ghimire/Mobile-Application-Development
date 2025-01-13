part of 'arithmetic_bloc.dart';

@immutable
sealed class ArithmeticEvent {}

class AdditionEvent extends ArithmeticEvent {
  final int first;
  final int second;

  AdditionEvent(this.first, this.second);
}

class SubtractionEvent extends ArithmeticEvent {
  final int first;
  final int second;

  SubtractionEvent(this.first, this.second);
}

class MultiplyEvent extends ArithmeticEvent {
  final int first;
  final int second;

  MultiplyEvent(this.first, this.second);
}
