//import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_application/common/design_system/app_loading_widget.dart';
import 'package:simple_application/presentation/home/bloc/home_bloc.dart';
import 'package:simple_application/presentation/home/bloc/home_state.dart';
import 'package:simple_application/presentation/home/widgets/item_widget.dart';

import '../../common/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Application'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (_, state) {
          return state.when(
              (data, page, isLoadMore, canLoadMore) => RefreshIndicator(
                  onRefresh: () => _bloc.init(),
                  child: NotificationListener(
                    onNotification: (notification) {
                      /// option 2: use ScrollController
                      if (notification is ScrollEndNotification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          if (canLoadMore && !isLoadMore) {
                            _bloc.loadMore();
                          }
                        }
                      }
                      return false;
                    },
                    child: Stack(
                      children: [
                        ListView.separated(
                            padding: kPadding[8],
                            itemBuilder: (context, index) => ItemWidget(
                                  data: data[index],
                                  index: index,
                                ),
                            separatorBuilder: (context, index) =>
                                kSpacingHeight12,
                            itemCount: data.length),
                        if (isLoadMore)
                          Positioned(
                            bottom: 16 + MediaQuery.of(context).padding.bottom,
                            left: 0,
                            right: 0,
                            child: const AppLoadingWidget(),
                          )
                      ],
                    ),
                  )),
              loading: () => const AppLoadingWidget(),
              error: (error) => ErrorWidget(error));
        },
      ),
    );
  }
}
