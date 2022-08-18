

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_application/domain/entity/pagination_entity.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required List<PaginationEntity> data,required int page,required bool isLoadMore,required bool canLoadMore}) = HomeStateData;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error(dynamic error) = HomeStateError;
}