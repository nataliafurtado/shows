import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/organism/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:home/presentation/widgets/search_page_success.dart';
import 'package:home/utils/home_strings.dart';
import 'package:micro_app/micro_app.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

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
        onTrashClick: () {
          controller.cleanSearch();
        },
      ),
      body: StateManagementWithRXNotBuilder(
        builder: (ctx) {
          if (controller.getSearchPageState == SearchPageState.loading) {
            return const LoadingCenterWidget();
          }

          if (controller.getSearchPageState == SearchPageState.error) {
            return const ErrorPage();
          }

          if (controller.getSearchPageState == SearchPageState.initial) {
            return const SizedBox.shrink();
          }

          if (controller.getSearchPageState ==
              SearchPageState.noShowsWereFound) {
            return Center(
              child: Text(
                HomeStrings.noShows,
              ),
            );
          }
          return controller.getShowLists.isNotEmpty
              ? const SearchPageSuccess()
              : const SizedBox();
        },
      ),
    );
  }
}
