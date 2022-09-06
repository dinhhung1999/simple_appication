import 'package:dio/dio.dart';
import 'package:simple_application/data/datasource/remote/base_api_service.dart';
import 'package:simple_application/domain/entity/pagination_entity.dart';

import '../../dto/pagination_dto.dart';

class HomeDataSource extends BaseApiService {
  Future<List<PaginationEntity>> getPagination({int? page, int? size}) async {
    try {
      /// used to implement pagination logic
      // Map<String, dynamic> param = {
      //   'size' : size ?? 10,
      //   'page' : page ?? 0
      // };

      /// because free API can't support pass parameters so i don't used to implement pagination logic
      final Response response = await dio.get('pagination');
      return (response.data as List<dynamic>)
          .map((e) => PaginationDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (err) {
      throw handlerError(err);
    }
  }
}
