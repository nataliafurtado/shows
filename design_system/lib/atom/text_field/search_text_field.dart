import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class SearchTextFIeld extends StatelessWidget {
  const SearchTextFIeld({
    Key? key,
    required this.onSearchClick,
  }) : super(key: key);

  final Function onSearchClick;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final sp = ThemeStyle.themeType.spaceTypes();
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sp.s2),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: ThemeStyle.themeType.colorType().secondary,
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  onSearchClick(controller.text);
                }
              },
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: ThemeStyle.themeType.colorType().secondary,
              ),
              onPressed: () {
                controller.clear();
              },
            ),
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
