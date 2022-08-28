import 'dart:async';

import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/widgets/horizontal_list.dart';
import 'package:home/presentation/widgets/list_widget_Error.dart';
import 'package:home/presentation/widgets/list_widget_finish.dart';
import 'package:micro_app/micro_app.dart';
import 'package:design_system/atom/widgets/loading_center_widget.dart';

import 'package:state_management/state_manager_with_rx_not.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  static const _remainingScrollSize = 200;
  late ScrollController _scrollController;
  Timer _throttle = Timer(const Duration(milliseconds: 10), () {});
  late HomeController controller;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    controller = MicroApp.instanceManager.get<HomeController>();
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < _remainingScrollSize) {
      if (_throttle.isActive) {
        return;
      }
      _throttle = Timer(const Duration(milliseconds: 1000), () {});
      if (!isLazyLoadScrollLocked) {
        controller.loadNextPage();
      }
    }
  }

  bool get isLazyLoadScrollLocked =>
      controller.getListPaginationState == ListPaginationState.loading;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Column(
      children: [
        Expanded(
          child: StateManagementWithRXNotBuilder(
            builder: (ctx) {
              final lisPaginationState = controller.getListPaginationState;
              return ListView.builder(
                controller: _scrollController,
                itemCount: controller.getShowListsLength + 1,
                padding: EdgeInsets.only(top: sp.s7),
                itemBuilder: (ctx, index) {
                  if (index >= controller.getShowListsLength) {
                    if (lisPaginationState == ListPaginationState.loading) {
                      return const SizedBox(
                        height: 150,
                        child: LoadingCenterWidget(),
                      );
                    }
                    if (lisPaginationState == ListPaginationState.error) {
                      return const ListWidgetError();
                    }
                    if (lisPaginationState == ListPaginationState.finish) {
                      return const ListWidgetFinish();
                    }
                    return const SizedBox.shrink();
                  }
                  return HorizontalList(
                    index: index,
                    isToTextOverflowCard: true,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
