import 'package:flutter/material.dart';
import 'package:simple_application/presentation/home/home_page.dart';

import '../di/injector.dart';

Navigation navigation = sl.get<Navigation>();

class RouteMissingArgsFailure implements Exception {}

abstract class RouterModule {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}

class AppRouter extends RouterModule {
  AppRouter();

  static const String home = '/home';

  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      AppRouter.home: MaterialPageRoute(
          builder: (context) => const HomePage(), settings: settings),
    };
  }
}

abstract class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments});

  Future<dynamic> replaceTo(String routeName, {dynamic arguments});

  Future<dynamic> removeUntil(String routeName, {dynamic arguments});

  void popUntil(String routeName, {dynamic arguments});

  void goBack<T extends Object?>([T? result]);

  bool canPop();
}

class NavigationImpl extends Navigation {
  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> removeUntil(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  @override
  void goBack<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.pop<T>(result);
  }

  @override
  void popUntil(String routeName, {arguments}) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  @override
  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }
}

class DetailBdsArgument {
  final int id;
  final bool? isSellPage;

  DetailBdsArgument({required this.id, this.isSellPage});
}
