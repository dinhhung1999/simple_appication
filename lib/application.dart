import 'package:flutter/material.dart';

import 'common/di/injector.dart';
import 'common/navigator/navigation.dart';
import 'common/navigator/router_observer.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [sl.get<AppRouteObserver>()],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      navigatorKey: navigation.navigatorKey,
      initialRoute: AppRouter.home,
      onGenerateRoute: (settings) =>
          generateRoute(routes: AppRouter(), settings: settings),
    );
  }

  Route<dynamic>? generateRoute({
    required RouterModule routes,
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    routesMap.addAll(routes.getRoutes(settings));
    return routesMap[settings.name];
  }
}
