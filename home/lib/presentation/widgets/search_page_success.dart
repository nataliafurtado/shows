import 'package:design_system/atom/card/show_card.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';

class SearchPageSuccess extends StatelessWidget {
  const SearchPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<SearchController>();
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 0,
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
          width: 150,
        );
      },
    );
  }
}
