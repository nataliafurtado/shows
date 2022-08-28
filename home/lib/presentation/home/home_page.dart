import 'package:design_system/organism/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:design_system/atom/app_bar/app_bar_widget.dart';
import 'package:design_system/layout/loading_widget.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/home/controller/list_widget.dart';
import 'package:home/utils/home_strings.dart';
import 'package:micro_app/micro_app.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  @override
  void initState() {
    controller = MicroApp.instanceManager.get<HomeController>();
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<HomeController>();

    return Scaffold(
      appBar: AppBarWidget(
        title: HomeStrings.appTitle,
        onSearchIconClick: () {
          Navigator.of(context).pushNamed('/search_page');
        },
      ),
      body: StateManagementWithRXNotBuilder(
        builder: (ctx) {
          final pageState = controller.homePageState.value;

          if (pageState == HomePageState.error) {
            return ErrorPage(
              onClick: controller.init,
            );
          }
          return LoadingWidget(
            isLoading: pageState == HomePageState.loading,
            child: ListWidget(
              key: UniqueKey(),
            ),
          );
        },
      ),
    );
  }
}
