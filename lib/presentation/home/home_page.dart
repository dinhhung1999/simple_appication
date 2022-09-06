//import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_application/common/design_system/app_loading_widget.dart';
import 'package:simple_application/presentation/home/bloc/home_cubit.dart';
import 'package:simple_application/presentation/home/bloc/home_state.dart';
import 'package:simple_application/presentation/home/widgets/item_widget.dart';

import '../../common/constants/app_constants.dart';
import '../../common/widgets/app_error_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  late final HomeCubit _cubit;


  @override
  Widget build(BuildContext context) {
    _cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Application'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (_, state) {
          return state.when((data, page, canLoadMore, loadMoreError) {
            return RefreshIndicator(
                onRefresh: () => _cubit.init(),
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final itemIndex = index ~/ 2;
                            if (index.isEven) {
                              if (itemIndex + 1 >= data.length) {
                                if (loadMoreError ?? false) {
                                  return AppErrorWidget(
                                      error: 'Load More Error', tryAgain: () => _cubit.loadMore());
                                } else {
                                  _cubit.loadMore();
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 24, bottom: 24 + MediaQuery.of(context).padding.bottom),
                                    child: const AppLoadingWidget(),
                                  );
                                }
                              }
                              return ItemWidget(
                                data: data[itemIndex],
                                index: itemIndex,
                              );
                            }
                            return kSpacingHeight12;
                          },
                          childCount: max(0, (canLoadMore ? data.length : data.length + 1) * 2 - 1),
                        ),
                      ),
                    )
                  ],
                ));
          },
              loading: () => const AppLoadingWidget(),
              error: (error) => AppErrorWidget(
                    error: error,
                    tryAgain: () => _cubit.init(),
                  ));
        },
      ),
    );
  }
}
