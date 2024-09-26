import 'package:either_dart/either.dart';
import 'package:tasketo/core/networking/models/error_model.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';

abstract class HomeRepo {
  Future<Either<List<TaskEntity>,Failure>> getTasks();
}