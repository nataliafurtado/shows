import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegularAppBar({
    Key? key,
    required this.onClick,
  }) : super(key: key);
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: ThemeStyle.themeType.colorType().secondary,
        iconSize: 20.0,
        onPressed: onClick,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
