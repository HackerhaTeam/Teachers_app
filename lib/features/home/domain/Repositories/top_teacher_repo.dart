import 'package:dartz/dartz.dart';
import 'package:teacher_hackerha/core/error/exceptions.dart';
import 'package:teacher_hackerha/features/home/domain/Entity/teacher_entity.dart';
abstract class TopTeacherRepositories {
  Future<Either<Failure, List<TeacherEntity>>> getTopTeacher();
}
