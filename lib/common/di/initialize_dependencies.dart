import '../../data/datasource/local/local_service.dart';
import '../configs/build_config.dart';
import '../navigator/navigation.dart';
import '../navigator/router_observer.dart';
import '../networking/interceptor/auth_interceptor.dart';
import '../networking/interceptor/logger_interceptor.dart';
import '../networking/rest_client.dart';
import 'injector.dart';

Future initializeDependencies() async {
  /// [LocalService]
  sl.registerSingleton(LocalService());

  /// [RestClient]
  sl.registerLazySingleton(
      () => RestClient(sl<BuildConfigs>().url(), interceptors: [
            LoggerInterceptor(),
            AuthInterceptor(),
          ]),
      instanceName: 'base'   /// can support microservice
      );

  /// [Navigation]
  sl.registerLazySingleton<Navigation>(() => NavigationImpl());

  /// [Navigator util]
  sl.registerSingleton(AppRouteObserver());
}
