import 'package:design_system/atom/text/text_title_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    Key? key,
    required this.name,
    required this.summary,
  }) : super(key: key);
  final String name;
  final String summary;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: sp.s4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sp.s2),
            child: TextTitleWidget(text: name),
          ),
          SizedBox(height: sp.s3),
          Html(
            data: summary,
          ),
        ],
      ),
    );
  }
}
