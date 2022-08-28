import 'package:design_system/atom/widgets/image_widget.dart';
import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/seasons_widget.dart';
import 'package:show_details/presentation/widgets/show_info.dart';
import 'package:show_details/presentation/widgets/summary_widget.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({
    Key? key,
    required this.show,
  }) : super(key: key);
  final Show show;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    controller.init(id: show.id);
    return Scaffold(
      appBar: RegularAppBar(
        onBackClick: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(sp.s6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sp.s2),
              ImageWidget(
                url: show.imageUrl,
                height: MediaQuery.of(context).size.width - sp.s12,
              ),
              SizedBox(height: sp.s4),
              SummaryWidget(
                name: show.name,
                summary: show.summary,
              ),
              SizedBox(height: sp.s4),
              ShowInfoWidget(
                days: show.schedule.days,
                genres: show.genres,
                time: show.schedule.time,
                status: show.status,
                type: show.type,
              ),
              const SeasonWidget(),
              SizedBox(height: sp.s15),
            ],
          ),
        ),
      ),
    );
  }
}
