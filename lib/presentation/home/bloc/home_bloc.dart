import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/di/injector.dart';
import '../../../domain/repository/pagination_repository.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final PaginationRepository _repository = sl.get();

  HomeBloc() : super(const HomeState.loading()) {
    init();
  }

  Future init() async {
    emit(const HomeState.loading());
    try {
      final data = await _repository.getPagination();
      emit(HomeState(
          data: data,
          page: 0,
          isLoadMore: false,
          canLoadMore: data.length == 10));
    } catch (err) {
      emit(HomeState.error(err));
    }
  }

  void loadMore() {
    try {
      state.mapOrNull((value) async {
        emit(value.copyWith(isLoadMore: true));
        final data = await _repository.getPagination(page: value.page + 1);
        emit(value.copyWith(
            data: [...value.data, ...data],
            page: value.page + 1,
            isLoadMore: false,
            canLoadMore: data.length == 10));
      });
    } catch (err) {
      emit(HomeState.error(err));
    }
  }
}
