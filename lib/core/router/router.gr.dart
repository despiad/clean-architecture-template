// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../features/counter/presentation/pages/counter_page.dart' as _i5;
import '../../features/greeter/presentation/pages/greeter_page.dart' as _i3;
import '../../features/home/presentation/pages/home_page.dart' as _i4;
import '../../features/nickname_generator/presentation/pages/nickname_generator_page.dart'
    as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    GreeterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.GreeterPage());
    },
    HomeRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HomePage());
    },
    CounterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.CounterPage());
    },
    NicknameGeneratorRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.NicknameGeneratorPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(GreeterRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/', children: [
          _i1.RouteConfig(CounterRoute.name, path: 'counter-page'),
          _i1.RouteConfig(NicknameGeneratorRoute.name,
              path: 'nickname-generator-page')
        ])
      ];
}

class GreeterRoute extends _i1.PageRouteInfo {
  const GreeterRoute() : super(name, path: '/');

  static const String name = 'GreeterRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', children: children);

  static const String name = 'HomeRoute';
}

class CounterRoute extends _i1.PageRouteInfo {
  const CounterRoute() : super(name, path: 'counter-page');

  static const String name = 'CounterRoute';
}

class NicknameGeneratorRoute extends _i1.PageRouteInfo {
  const NicknameGeneratorRoute() : super(name, path: 'nickname-generator-page');

  static const String name = 'NicknameGeneratorRoute';
}
