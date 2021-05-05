import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_template/injection.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_template/core/router/router.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
      ),
      title: 'Clean Architecture Template',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (_, router) => router!,
    );
  }
}
