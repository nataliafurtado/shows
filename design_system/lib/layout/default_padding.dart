import 'package:flutter/material.dart';
import 'package:design_system/theme_style.dart';

class SidesPadding extends StatelessWidget {
  const SidesPadding({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? sp.s5,
      ),
      child: child,
    );
  }
}
