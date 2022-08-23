import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

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
        backgroundColor: MaterialStateProperty.all(
          ThemeStyle.themeType.colorType().primary,
        ),
      ),
      onPressed: onPressed,
      child: const Icon(
        Icons.play_arrow_sharp,
        color: Colors.grey,
        size: 35,
      ),
    );
  }
}
