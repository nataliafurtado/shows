import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class TextSubtitleWidget extends StatelessWidget {
  const TextSubtitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: ThemeStyle.themeType.textType().l2.copyWith(),
    );
  }
}
