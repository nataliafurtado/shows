import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sp.s6),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(sp.s3)),
        backgroundColor: MaterialStateProperty.all(
          ThemeStyle.themeType.colorType().primary,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: ThemeStyle.themeType.colorType().secondary,
        ),
      ),
    );
  }
}
