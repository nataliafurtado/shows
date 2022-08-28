import 'package:design_system/atom/text_field/search_text_field.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegularAppBar({
    Key? key,
    required this.onBackClick,
    this.onSearchClick,
    this.onTrashClick,
  }) : super(key: key);

  final VoidCallback onBackClick;
  final Function? onSearchClick;
  final Function? onTrashClick;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: ThemeStyle.themeType.colorType().secondary,
        iconSize: 20.0,
        onPressed: onBackClick,
      ),
      title: onSearchClick != null
          ? SearchTextFIeld(
              onSearchClick: onSearchClick!,
              onTrashClick: onTrashClick,
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
