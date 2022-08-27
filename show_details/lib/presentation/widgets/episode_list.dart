import 'package:design_system/atom/text/text_subtitle_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/episode_horizontal_list.dart';
import 'package:show_details/utils/show_details_strings.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    final lisPaginationState = controller.seasonsList;
    final sp = ThemeStyle.themeType.spaceTypes();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: lisPaginationState.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: sp.s7),
      itemBuilder: (ctx, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSubtitleWidget(
              text:
                  '${ShowDetailsStrings.season} ${lisPaginationState[index].seasonId}',
            ),
            SizedBox(height: sp.s2),
            EpisodeHorizontalList(index: index),
            SizedBox(height: sp.s2),
          ],
        );
      },
    );
  }
}
