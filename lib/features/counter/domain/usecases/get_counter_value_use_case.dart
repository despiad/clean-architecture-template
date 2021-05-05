import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import 'package:clean_architecture_template/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCounterValueUseCase implements UseCase<int, NoParams> {
  final CounterRepository counterRepository;

  GetCounterValueUseCase(this.counterRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await counterRepository.getCounterValue();
  }
}
