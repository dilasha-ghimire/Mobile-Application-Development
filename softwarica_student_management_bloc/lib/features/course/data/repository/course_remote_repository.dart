import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDatasource _courseRemoteDatasource;
  CourseRemoteRepository(
      {required CourseRemoteDatasource courseRemoteDatasource})
      : _courseRemoteDatasource = courseRemoteDatasource;

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity courseEntity) async {
    try {
      _courseRemoteDatasource.createCourse(courseEntity);
      return Right(null);
    }
    catch(e) {
      return Left(
        ApiFailure(
          message: e.toString()
        )
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final courses = await _courseRemoteDatasource.getCourses();
      return Right(courses);
    }
    catch(e) {
      return Left(
        ApiFailure(
          message: e.toString()
        )
      );
    }
  }
}
