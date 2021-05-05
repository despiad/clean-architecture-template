import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class CounterLocalDataSource {
  Future<int> getCachedCounterValue();

  Future<void> cacheCounterValue(int value);
}

const CACHED_COUNTER_VALUE = 'CACHED_COUNTER_VALUE';

@LazySingleton(as: CounterLocalDataSource)
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final SharedPreferences sharedPreferences;

  CounterLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheCounterValue(int value) {
    return sharedPreferences.setInt(CACHED_COUNTER_VALUE, value);
  }

  @override
  Future<int> getCachedCounterValue() {
    final value = sharedPreferences.getInt(CACHED_COUNTER_VALUE);
    if (value != null) {
      return Future.value(value);
    } else {
      throw CacheException();
    }
  }
}
