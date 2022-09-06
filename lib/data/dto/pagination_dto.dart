import 'package:json_annotation/json_annotation.dart';
import 'package:simple_application/domain/entity/pagination_entity.dart';
part 'pagination_dto.g.dart';

@JsonSerializable()
class PaginationDto extends PaginationEntity {
  @override
  final String? content;

  @override
  final int? id;

  @override
  final String? title;

  PaginationDto(this.content, this.id, this.title);

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);
}
