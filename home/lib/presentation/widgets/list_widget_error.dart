import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class ListWidgetError extends StatelessWidget {
  const ListWidgetError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Icon(
        Icons.new_releases,
        size: 50,
        color: ThemeStyle.themeType.colorType().secondary,
      ),
    );
  }
}
