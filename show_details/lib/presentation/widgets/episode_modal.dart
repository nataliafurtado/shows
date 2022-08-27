import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/episode.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';
import 'package:show_details/utils/show_details_strings.dart';

class EpisodeModal extends StatelessWidget {
  const EpisodeModal({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(sp.s4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(sp.s3)),
                  child: CachedNetworkImage(
                    imageUrl: episode.imageUrl,
                    height: 100,
                    errorWidget: (context, url, error) =>
                        const PlaceHolderWidget(),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const LoadingCenterWidget(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          episode.name,
                          style: ThemeStyle.themeType.textType().l2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: sp.s2),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: sp.s5),
                        child: Text(
                          '${ShowDetailsStrings.season} ${episode.season}, ${ShowDetailsStrings.episode} ${episode.number}',
                          style: ThemeStyle.themeType.textType().l1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Html(
              data: episode.summary,
            ),
            SizedBox(height: sp.s5),
          ],
        ),
      ),
    );
  }
}
