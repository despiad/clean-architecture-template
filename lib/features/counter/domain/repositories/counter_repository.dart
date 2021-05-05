import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepository {
  Future<Either<Failure, int>> getCounterValue();

  Future<Either<Failure, NoParams>> saveCounterValue(int value);
}
