// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clean_architecture_template/core/modules/third_party_injectable_module.dart'
    as _i10;
import 'package:clean_architecture_template/features/counter/data/datasources/counter_local_data_source.dart'
    as _i4;
import 'package:clean_architecture_template/features/counter/data/repositories/counter_repository_impl.dart'
    as _i6;
import 'package:clean_architecture_template/features/counter/domain/repositories/counter_repository.dart'
    as _i5;
import 'package:clean_architecture_template/features/counter/domain/usecases/get_counter_value_use_case.dart'
    as _i7;
import 'package:clean_architecture_template/features/counter/domain/usecases/save_counter_value_use_case.dart'
    as _i8;
import 'package:clean_architecture_template/features/counter/presentation/bloc/counter_bloc.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyInjectableModule = _$ThirdPartyInjectableModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => thirdPartyInjectableModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i4.CounterLocalDataSource>(
      () => _i4.CounterLocalDataSourceImpl(get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i5.CounterRepository>(
      () => _i6.CounterRepositoryImpl(get<_i4.CounterLocalDataSource>()));
  gh.lazySingleton<_i7.GetCounterValueUseCase>(
      () => _i7.GetCounterValueUseCase(get<_i5.CounterRepository>()));
  gh.lazySingleton<_i8.SaveCounterValueUseCase>(
      () => _i8.SaveCounterValueUseCase(get<_i5.CounterRepository>()));
  gh.factory<_i9.CounterBloc>(() => _i9.CounterBloc(
      get<_i8.SaveCounterValueUseCase>(), get<_i7.GetCounterValueUseCase>()));
  return get;
}

class _$ThirdPartyInjectableModule extends _i10.ThirdPartyInjectableModule {}
