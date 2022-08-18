import 'package:simple_application/data/repository/pagination_repository_impl.dart';
import 'package:simple_application/domain/repository/pagination_repository.dart';

import 'injector.dart';

void injectorRepository() {
  sl.registerLazySingleton<PaginationRepository>(
      () => PaginationRepositoryImpl());
}
