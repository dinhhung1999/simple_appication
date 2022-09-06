import 'package:simple_application/domain/entity/pagination_entity.dart';

abstract class HomeRepository {
  Future<List<PaginationEntity>> getPagination({int? page, int? size});
}
