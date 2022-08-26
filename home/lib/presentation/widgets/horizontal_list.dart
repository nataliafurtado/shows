import 'dart:async';

import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:micro_app/micro_app.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList(
    this.index, {
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  static const _remainingScrollSize = 100;
  late ScrollController _scrollController;
  Timer _throttle = Timer(const Duration(milliseconds: 10), () {});
  late HomeController controller;
  int page = 1;

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
      controller.getShowList(widget.index, page++);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    final shows = controller.getShowList(widget.index, page);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      primary: false,
      child: Container(
        height: 240,
        padding: EdgeInsets.only(left: sp.s7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            shows.length,
            (indexShow) => Row(
              children: [
                ShowCard(
                  name: shows[indexShow].name,
                  imageUrl: shows[indexShow].imageUrl,
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      '/show_details_page',
                      arguments: shows[indexShow],
                    );
                  },
                  ratio: 59 / 42,
                  width: 150,
                ),
                SizedBox(width: sp.s2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
