import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/micro_app.dart';

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
      // body: ,
    );
  }
}
