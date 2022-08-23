import 'package:design_system/layout/default_padding.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class LinkCardWidget extends StatelessWidget {
  const LinkCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: sp.s4),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      child: SidesPadding(
        padding: sp.s4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: ThemeStyle.themeType.textType().cardTitle,
            ),
            SizedBox(height: sp.s2),
            Text(
              subTitle,
              style: ThemeStyle.themeType.textType().cardSubTitle,
            ),
            SizedBox(height: sp.s6),
          ],
        ),
      ),
    );
  }
}
