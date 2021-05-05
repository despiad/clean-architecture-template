import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import 'package:clean_architecture_template/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveCounterValueUseCase implements UseCase<NoParams, int> {
  final CounterRepository counterRepository;

  SaveCounterValueUseCase(this.counterRepository);

  @override
  Future<Either<Failure, NoParams>> call(int params) async {
    return await counterRepository.saveCounterValue(params);
  }
}
