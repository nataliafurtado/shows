import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class ListWidgetFinish extends StatelessWidget {
  const ListWidgetFinish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pan_tool,
            size: 50,
            color: ThemeStyle.themeType.colorType().secondary,
          ),
          SizedBox(
            width: sp.s4,
          ),
          const Text('Finish'),
        ],
      ),
    );
  }
}
