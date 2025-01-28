import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class DeleteCourseParams {
  final String courseId;

  DeleteCourseParams({required this.courseId});
}

class DeleteCourseUsecase implements UsecaseWithParams<void, DeleteCourseParams> {
  final ICourseRepository courseRepository;

  DeleteCourseUsecase({required this.courseRepository});

  @override
  Future<Either<Failure, void>> call(DeleteCourseParams params) {
    return courseRepository.deleteCourse(params.courseId);
  }
}