import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class TextTwoFields extends StatelessWidget {
  const TextTwoFields(
    this.firstText,
    this.secondText, {
    Key? key,
  }) : super(key: key);
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: ThemeStyle.themeType.textType().l2.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(width: sp.s2),
        Expanded(
          child: Text(
            secondText,
            style: ThemeStyle.themeType.textType().l1.copyWith(
                  height: 1.2,
                ),
          ),
        ),
      ],
    );
  }
}
