import 'package:simple_application/domain/entity/pagination_entity.dart';

abstract class PaginationRepository {
  Future<List<PaginationEntity>> getPagination({int? page, int? size});
}
