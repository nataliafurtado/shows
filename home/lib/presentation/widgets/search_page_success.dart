import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';

class SearchPageSuccess extends StatelessWidget {
  const SearchPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<SearchController>();
    final sp = ThemeStyle.themeType.spaceTypes();
    return AlignedGridView.count(
      padding: EdgeInsets.only(top: sp.s3),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      itemCount: controller.getShowListLength,
      itemBuilder: (context, index) {
        return ShowCard(
          name: controller.getShowLists[index].name,
          imageUrl: controller.getShowLists[index].imageUrl,
          onClick: () {
            Navigator.pushNamed(
              context,
              '/show_details_page',
              arguments: controller.getShowLists[index],
            );
          },
          ratio: 59 / 42,
          width: 140,
          isToTextOverflowCard: false,
        );
      },
    );
  }
}
