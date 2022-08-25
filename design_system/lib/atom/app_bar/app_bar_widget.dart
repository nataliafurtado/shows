import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.onSearchIconClick,
  }) : super(key: key);
  final String title;
  final VoidCallback onSearchIconClick;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox(
        width: 40,
      ),
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: ThemeStyle.themeType.colorType().secondary,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: onSearchIconClick,
            child: Icon(
              Icons.search,
              color: ThemeStyle.themeType.colorType().secondary,
              size: 26.0,
            ),
          ),
        ),
      ],
    );
  }
}
