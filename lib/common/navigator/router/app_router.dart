


import 'package:flutter/material.dart';

import '../../../presentation/home/home_page.dart';
import 'router_module.dart';



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