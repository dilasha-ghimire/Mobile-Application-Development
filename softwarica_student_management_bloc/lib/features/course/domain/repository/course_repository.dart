import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseRepository {
  Future<Either<Failure, void>> createCourse(CourseEntity courseEntity);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  Future<Either<Failure, void>> deleteCourse(String id);
}