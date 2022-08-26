import 'package:design_system/atom/widgets/image_widget.dart';
import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:design_system/atom/text/text_title_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/presentation/widgets/seasons_widget.dart';
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
    controller.init(show.id);
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
              TextTitleWidget(text: show.name),
              SizedBox(height: sp.s6),
              ImageWidget(
                url: show.imageUrl,
                height: 300,
              ),
              SizedBox(height: sp.s4),
              Html(
                data: show.summary,
              ),
              SizedBox(height: sp.s4),
              SummaryWidget(show: show),
              const SeasonWidget(),
              SizedBox(height: sp.s15),
            ],
          ),
        ),
      ),
    );
  }
}
