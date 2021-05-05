import 'package:clean_architecture_template/core/error/exceptions.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import 'package:clean_architecture_template/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:clean_architecture_template/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource counterLocalDataSource;

  CounterRepositoryImpl(this.counterLocalDataSource);

  @override
  Future<Either<Failure, int>> getCounterValue() async {
    try {
      final value = await counterLocalDataSource.getCachedCounterValue();
      return Right(value);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> saveCounterValue(int value) async {
    try {
      await counterLocalDataSource.cacheCounterValue(value);
      return Right(NoParams());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
