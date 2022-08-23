import 'package:design_system/atom/button/button_widget.dart';
import 'package:design_system/layout/default_padding.dart';
import 'package:design_system/theme_style.dart';
import 'package:design_system/utils/ds_strings.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.onClick,
  }) : super(key: key);
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final textType = ThemeStyle.themeType.textType();
    final sp = ThemeStyle.themeType.spaceTypes();
    return SidesPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DSStrings.anErroHasOccurred,
            style: textType.l3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: sp.s12),
          ButtonWidget(
            onPressed: onClick,
            label: DSStrings.backToHome,
          )
        ],
      ),
    );
  }
}
