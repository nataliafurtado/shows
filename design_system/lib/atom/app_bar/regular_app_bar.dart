import 'package:design_system/atom/text_field/search_text_field.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegularAppBar({
    Key? key,
    required this.onBackClick,
    this.onSearchClick,
    this.onTrashClick,
    this.showBackIcon = false,
  }) : super(key: key);

  final VoidCallback onBackClick;
  final Function? onSearchClick;
  final Function? onTrashClick;
  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ThemeStyle.themeType.colorType().primary,
      leading: showBackIcon
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: ThemeStyle.themeType.colorType().secondary,
              iconSize: 20.0,
              onPressed: onBackClick,
            )
          : null,

      // leadingWidth: 40,
      // // centerTitle: true,
      // actions: [
      //   Container(
      //     // color: Colors.amber,
      //     width: 40,
      //   )
      // ],
      title: onSearchClick != null
          ? SearchTextFIeld(
              onSearchClick: onSearchClick!,
              onTrashClick: onTrashClick,
              onBackClick: onBackClick,
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
