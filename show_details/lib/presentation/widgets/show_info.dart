import 'package:design_system/atom/text/text_title_widget.dart';
import 'package:design_system/atom/text/text_two_fields.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:show_details/utils/show_details_strings.dart';

class ShowInfoWidget extends StatelessWidget {
  const ShowInfoWidget({
    Key? key,
    required this.days,
    required this.time,
    required this.genres,
    required this.type,
    required this.status,
  }) : super(key: key);
  final List<String> days;
  final String time;
  final List<String> genres;
  final String type;
  final String status;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();

    return Container(
      decoration: BoxDecoration(
        color: ThemeStyle.themeType.colorType().primary,
        borderRadius: BorderRadius.all(
          Radius.circular(sp.s2),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: sp.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: sp.s4),
          TextTitleWidget(
            text: ShowDetailsStrings.showInfo,
          ),
          SizedBox(height: sp.s4),
          if (days.isNotEmpty || time.isNotEmpty)
            TextTwoFields(
              '${ShowDetailsStrings.schedule}:',
              loadSchedule(),
            ),
          if (days.isNotEmpty || time.isNotEmpty) SizedBox(height: sp.s2),
          if (genres.isNotEmpty)
            TextTwoFields(
              '${ShowDetailsStrings.genres}:',
              loadGenre(),
            ),
          if (genres.isNotEmpty) SizedBox(height: sp.s2),
          if (status.isNotEmpty)
            TextTwoFields(
              '${ShowDetailsStrings.status}:',
              status,
            ),
          if (status.isNotEmpty) SizedBox(height: sp.s2),
          if (type.isNotEmpty)
            TextTwoFields(
              '${ShowDetailsStrings.showType}:',
              type,
            ),
          if (type.isNotEmpty) SizedBox(height: sp.s2),
          SizedBox(height: sp.s2),
        ],
      ),
    );
  }

  String loadSchedule() {
    String schedule = '';
    if (days.isEmpty && time.isNotEmpty) {
      schedule = time;
    }
    if (days.isNotEmpty && time.isEmpty) {
      schedule = loadDays();
    }
    if (days.isNotEmpty && time.isNotEmpty) {
      schedule = '${loadDays()} at $time';
    }
    return schedule;
  }

  String loadDays() {
    return days.join(', ');
  }

  String loadGenre() {
    return genres.join(' | ');
  }
}
