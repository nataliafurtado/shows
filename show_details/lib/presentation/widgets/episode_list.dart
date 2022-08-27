import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/episode.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/episode_modal.dart';
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
            Text(
              '${ShowDetailsStrings.season} ${lisPaginationState[index].seasonId}',
              style: ThemeStyle.themeType
                  .textType()
                  .l2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: sp.s2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              primary: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  lisPaginationState[index].seasons.length,
                  (indexEpisodes) => Row(
                    children: [
                      ShowCard(
                        name:
                            '${ShowDetailsStrings.epi} ${indexEpisodes + 1} - ${lisPaginationState[index].seasons[indexEpisodes].name}',
                        imageUrl: lisPaginationState[index]
                            .seasons[indexEpisodes]
                            .imageUrl,
                        onClick: () {
                          _showModalInfo(
                              context,
                              lisPaginationState[index].seasons[indexEpisodes],
                              sp);
                        },
                        ratio: 14 / 25,
                        width: 200,
                      ),
                      SizedBox(width: sp.s2),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: sp.s2),
          ],
        );
      },
    );
  }

  _showModalInfo(context, Episode episode, sp) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sp.s3),
      ),
      builder: (context) => EpisodeModal(episode: episode),
    );
  }
}
