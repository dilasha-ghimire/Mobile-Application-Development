import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/local_datasource/course_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalDataSource _courseLocalDataSource;

  CourseLocalRepository({required CourseLocalDataSource courseLocalDataSource})
    : _courseLocalDataSource = courseLocalDataSource;
  
  @override
  Future<Either<Failure, void>> createCourse(CourseEntity courseEntity) {
    try {
      _courseLocalDataSource.createCourse(courseEntity);
      return Future.value(Right(null));
    }
    catch(e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) async{
    try {
      await _courseLocalDataSource.deleteCourse(id);
      return Right(null);
    }
    catch(e) {
      return Left(LocalDatabaseFailure(message: "Error deleting course: $e"));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async{
    try {
      final courses = await _courseLocalDataSource.getCourses();
      return Right(courses);
    }
    catch(e) {
      return Left(LocalDatabaseFailure(message: "Error getting all courses: $e"));
    }
  }
}