import 'package:design_system/atom/text/text_two_fields.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter/material.dart';
import 'package:show_details/utils/show_details_strings.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    Key? key,
    required this.show,
  }) : super(key: key);
  final Show show;

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
      padding: EdgeInsets.all(sp.s2),
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
          SizedBox(height: sp.s2),
        ],
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
