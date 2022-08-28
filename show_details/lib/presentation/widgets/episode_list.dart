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
      padding: EdgeInsets.only(top: sp.s3),
      itemBuilder: (ctx, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextSubtitleWidget(
                  text:
                      '${ShowDetailsStrings.season} ${lisPaginationState[index].seasonId}',
                ),
                SizedBox(width: sp.s2),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 15,
                )
              ],
            ),
            SizedBox(height: sp.s2),
            EpisodeHorizontalList(index: index),
            SizedBox(height: sp.s3),
          ],
        );
      },
    );
  }
}
