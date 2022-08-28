import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/episode.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/episode_modal.dart';
import 'package:show_details/utils/show_details_strings.dart';

class EpisodeHorizontalList extends StatelessWidget {
  const EpisodeHorizontalList({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    final lisPaginationState = controller.seasonsList;
    final sp = ThemeStyle.themeType.spaceTypes();
    return SingleChildScrollView(
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
                imageUrl:
                    lisPaginationState[index].seasons[indexEpisodes].imageUrl,
                onClick: () {
                  _showModalInfo(context,
                      lisPaginationState[index].seasons[indexEpisodes], sp);
                },
                ratio: 14 / 25,
                width: 200,
                isToTextOverflowCard: false,
              ),
              SizedBox(width: sp.s2),
            ],
          ),
        ),
      ),
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
