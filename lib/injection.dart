import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_architecture_template/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  usesNullSafety: true
)
void configureDependencies() => $initGetIt(getIt);
