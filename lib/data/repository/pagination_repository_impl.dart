

import 'package:simple_application/domain/entity/pagination_entity.dart';
import 'package:simple_application/domain/repository/pagination_repository.dart';

import '../datasource/remote/pagination_api_service.dart';

class PaginationRepositoryImpl implements PaginationRepository {

  final PaginationApiService _apiService = PaginationApiService();


  @override
  Future<List<PaginationEntity>> getPagination({int? page, int? size}) {
    return _apiService.getPagination(page: page,size: size);
  }

}