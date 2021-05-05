import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_template/features/counter/presentation/pages/counter_page.dart';
import 'package:clean_architecture_template/features/greeter/presentation/pages/greeter_page.dart';
import 'package:clean_architecture_template/features/home/presentation/pages/home_page.dart';
import 'package:clean_architecture_template/features/nickname_generator/presentation/pages/nickname_generator_page.dart';
import 'package:injectable/injectable.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: GreeterPage),
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: CounterPage),
        AutoRoute(page: NicknameGeneratorPage),
      ],
    )
  ],
)
class $AppRouter {}
