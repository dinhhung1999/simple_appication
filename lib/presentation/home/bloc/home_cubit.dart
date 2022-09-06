import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/di/injector.dart';
import '../../../domain/repository/pagination_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository = sl.get();

  HomeCubit() : super(const HomeState.loading()) {
    init();
  }

  Future init() async {
    emit(const HomeState.loading());
    try {
      final data = await _repository.getPagination();
      emit(HomeState(
          data: data,
          page: 0,
          canLoadMore: data.length == 10));
    } catch (err) {
      emit(HomeState.error(err));
    }
  }

  void loadMore() {
    state.mapOrNull((value) async {
      try {
        emit(value.copyWith(loadMoreError: false));
        final data = await _repository.getPagination(page: value.page + 1);
        emit(value.copyWith(
            data: [...value.data, ...data],
            page: value.page + 1,
            loadMoreError: false,
            canLoadMore: data.length == 10));
      } catch (err) {
        emit(value.copyWith(loadMoreError: true));
      }
    });

  }
}
