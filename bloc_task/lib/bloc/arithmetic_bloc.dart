// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'arithmetic_event.dart';
// part 'arithmetic_state.dart';

// class ArithmeticBloc extends Bloc<ArithmeticEvent, ArithmeticState> {
//   ArithmeticBloc() : super(ArithmeticInitial()) {
//     on<AdditionEvent>((event, emit) {
//       final result = event.first + event.second;
//       emit(result as ArithmeticState);
//     });
//     on<SubtractionEvent>((event, emit) {
//       final result = event.first - event.second;
//       emit(result as ArithmeticState);
//     });
//     on<MultiplyEvent>((event, emit) {
//       final result = event.first * event.second;
//       emit(result as ArithmeticState);
//     });
//   }
// }

// // event, state and bloc
