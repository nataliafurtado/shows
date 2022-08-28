import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.onSearchIconClick,
    required this.onChangeIconClick,
  }) : super(key: key);

  final VoidCallback onSearchIconClick;
  final VoidCallback onChangeIconClick;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: GestureDetector(
          onTap: onChangeIconClick,
          child: Icon(
            Icons.change_circle_outlined,
            color: ThemeStyle.themeType.colorType().secondary,
            size: 26.0,
          ),
        ),
      ),
      title: Center(
        child: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/tvm.png',
            package: 'home',
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
