import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:design_system/atom/text/text_two_fields.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter/material.dart';
import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';
import 'package:show_details/utils/show_details_strings.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({
    Key? key,
    required this.show,
  }) : super(key: key);
  final Show show;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    //    late HomeController controller;

    final controller = MicroApp.instanceManager.get<ShowDetailsController>();
    controller.init();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeStyle.themeType.colorType().primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ThemeStyle.themeType.colorType().secondary,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.amber,
          padding: EdgeInsets.all(sp.s6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                show.name,
                style: ThemeStyle.themeType.textType().l4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: sp.s6),
              CachedNetworkImage(
                imageUrl: show.imageUrl,
                height: 300,
                fit: BoxFit.fitHeight,
                errorWidget: (context, url, error) => const PlaceHolderWidget(),
                progressIndicatorBuilder: (context, url, progress) =>
                    const LoadingCenterWidget(),
              ),
              SizedBox(height: sp.s4),
              Html(
                data: show.summary,
              ),
              SizedBox(height: sp.s4),
              Container(
                color: ThemeStyle.themeType.colorType().primary,
                padding: EdgeInsets.all(sp.s2),
                // padding: EdgeInsets.symmetric(vertical: sp.s2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ShowDetailsStrings.showInfo,
                      style: ThemeStyle.themeType.textType().l3,
                    ),
                    SizedBox(height: sp.s4),
                    TextTwoFields(
                      '${ShowDetailsStrings.schedule}:',
                      '${loadDays(show.schedule.days)} at ${show.schedule.time}',
                    ),
                    SizedBox(height: sp.s2),
                    TextTwoFields(
                      '${ShowDetailsStrings.genres}:',
                      loadGenre(show.genres),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sp.s15),
            ],
          ),
        ),
      ),
    );
  }

  String loadDays(List<String> days) {
    return days.join(', ');
  }

  String loadGenre(List<String> days) {
    return days.join(' | ');
  }
}
