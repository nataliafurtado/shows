import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/episode.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/utils/show_details_strings.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

class SeasonWidget extends StatelessWidget {
  const SeasonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    return StateManagementWithRXNotBuilder(
      builder: (ctx) {
        final lisPaginationState = controller.seasonsList;
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
                  style: ThemeStyle.themeType.textType().l3,
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
                                lisPaginationState[index]
                                    .seasons[indexEpisodes],
                              );
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
      },
    );
  }

  _showModalInfo(context, Episode episode) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '${ShowDetailsStrings.season} ${episode.number}',
                            style: ThemeStyle.themeType.textType().l1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '${ShowDetailsStrings.episode} ${episode.season} ',
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
