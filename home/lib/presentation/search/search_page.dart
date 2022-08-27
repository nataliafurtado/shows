import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/micro_app.dart';
import 'package:state_management/state_manager_with_rx_not.dart';
import 'package:packages/exports.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<SearchController>();
    return Scaffold(
      appBar: RegularAppBar(
        onBackClick: () {
          Navigator.of(context).pop();
        },
        onSearchClick: (query) {
          controller.searchShow(query);
        },
      ),
      body: StateManagementWithRXNotBuilder(
        builder: (ctx) {
          if (controller.getSearchPageState == SearchPageState.loading) {
            return const LoadingCenterWidget();
          }

          if (controller.getSearchPageState == SearchPageState.error) {
            return const LoadingCenterWidget();
          }

          if (controller.getSearchPageState == SearchPageState.initial) {
            return const SizedBox.shrink();
          }
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
        },
      ),
    );
  }
}
