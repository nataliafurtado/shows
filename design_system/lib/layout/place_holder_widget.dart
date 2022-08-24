import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.image,
        color: ThemeStyle.themeType.colorType().secondary,
      ),
    );
  }
}
