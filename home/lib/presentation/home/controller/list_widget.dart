import 'dart:async';

import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:micro_app/micro_app.dart';
import 'package:design_system/organism/lists/horizontal_list.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  static const _remainingScrollSize = 100;
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
      // if (!isLazyLoadScrollLocked) {
      controller.getShows('');
      print("ssssssssssssssssssssssssssssssssssss");
      // searchController.loadNextPage();
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: controller.showsLists.value.length,
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Container(
            // height: 300,
            // color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                HorizontalList(
                  shows: controller.showsLists.value[index],
                ),
                SizedBox(height: sp.s2),
              ],
            ),
          );
        },
      ),
    );
  }
}
