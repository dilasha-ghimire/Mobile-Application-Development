import 'package:bloc_task/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<List<User>> {
  UserCubit() : super([]);

  void addUser(User user) {
    final updatedList = List<User>.from(state)..add(user);
    emit(updatedList);
  }
}
