import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class LoadingCenterWidget extends StatelessWidget {
  const LoadingCenterWidget({
    Key? key,
    this.height = 35,
    this.width = 35,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          color: ThemeStyle.themeType.colorType().secondary,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
