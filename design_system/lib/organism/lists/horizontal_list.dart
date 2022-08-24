import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/show.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final List<Show> shows;

  const HorizontalList({
    Key? key,
    required this.shows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      primary: false,
      child: Container(
        height: 250,
        padding: EdgeInsets.only(left: sp.s7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            shows.length,
            (index) => Row(
              children: [
                SizedBox(
                  width: sp.s2,
                ),
                ShowCard(
                  name: shows[index].name,
                  imageUrl: shows[index].imageUrl,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
