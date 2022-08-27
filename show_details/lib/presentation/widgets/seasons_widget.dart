import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/organism/pages/error_page.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/episode_list.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

class SeasonWidget extends StatelessWidget {
  const SeasonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    return StateManagementWithRXNotBuilder(
      builder: (ctx) {
        if (controller.getSeasonState == SeasonsState.error) {
          return ErrorPage(
            onClick: controller.init,
          );
        }

        if (controller.getSeasonState == SeasonsState.loading) {
          return Container(
            margin: EdgeInsets.only(top: sp.s10),
            child: const LoadingCenterWidget(),
          );
        }
        return const EpisodeList();
      },
    );
  }
}
