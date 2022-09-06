import 'package:simple_application/data/repository/home_repository_impl.dart';
import 'package:simple_application/domain/repository/pagination_repository.dart';

import 'injector.dart';

void injectorRepository() {
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl());
}
