

import 'package:simple_application/domain/entity/pagination_entity.dart';
import 'package:simple_application/domain/repository/pagination_repository.dart';

import '../datasource/remote/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeDataSource _dataSource = HomeDataSource();


  @override
  Future<List<PaginationEntity>> getPagination({int? page, int? size}) {
    return _dataSource.getPagination(page: page,size: size);
  }

}