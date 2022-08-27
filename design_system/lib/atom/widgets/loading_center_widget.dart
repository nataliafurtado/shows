import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class LoadingCenterWidget extends StatelessWidget {
  const LoadingCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ThemeStyle.themeType.colorType().secondary,
      ),
    );
  }
}
