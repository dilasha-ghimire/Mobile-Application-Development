import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/create_auth_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final BatchBloc _batchBloc;
  final CourseBloc _courseBloc;
  final CreateAuthUsecase _createAuthUsecase;

  RegisterBloc({
    required BatchBloc batchBloc,
    required CourseBloc courseBloc,
    required CreateAuthUsecase createAuthUsecase
  }) :  _batchBloc = batchBloc,
        _courseBloc = courseBloc,
        _createAuthUsecase = createAuthUsecase,
        super(RegisterState.initial()) {
          on<LoadCoursesAndBatches>(_onRegisterEvent);
          on<RegisterStudent>(_onRegisterStudent);
    
    add(LoadCoursesAndBatches());
  }

  void _onRegisterEvent(
    LoadCoursesAndBatches event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _batchBloc.add(LoadBatches());
    _courseBloc.add(LoadCourses());
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  Future<void> _onRegisterStudent(RegisterStudent event, Emitter<RegisterState> emit) async{
    emit(state.copyWith(isLoading: true));
    final result = await _createAuthUsecase
      .call(CreateAuthParams(
        fname: event.fname, 
        lname: event.lname, 
        phone: event.phone, 
        batch: event.batch,
        courses: event.courses,
        username: event.username, 
        password: event.password
      ));
    result.fold(
      (failure) =>
        emit(state.copyWith(isLoading: false, isSuccess: false, error: failure.message)),
      (auth) {
        emit(state.copyWith(isLoading: false, isSuccess: true, error: null));
      }
    );
  }
}
