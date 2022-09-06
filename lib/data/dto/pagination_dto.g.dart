// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      json['content'] as String?,
      json['id'] as int?,
      json['title'] as String?,
    );

Map<String, dynamic> _$PaginationDtoToJson(PaginationDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'title': instance.title,
    };
