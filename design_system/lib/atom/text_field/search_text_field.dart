import 'dart:async';

import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class SearchTextFIeld extends StatefulWidget {
  const SearchTextFIeld({
    Key? key,
    required this.onSearchClick,
    this.onTrashClick,
    required this.onBackClick,
  }) : super(key: key);

  final Function onSearchClick;
  final Function? onTrashClick;
  final Function? onBackClick;

  @override
  State<SearchTextFIeld> createState() => _SearchTextFIeldState();
}

class _SearchTextFIeldState extends State<SearchTextFIeld> {
  TextEditingController controller = TextEditingController();
  Timer? _debounce;
  final _duration = const Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sp.s2),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: (text) {
            if (_debounce?.isActive ?? false) _debounce!.cancel();
            _debounce = Timer(
              _duration,
              () {
                if (text.length >= 2) {
                  widget.onSearchClick(controller.text);
                  FocusScope.of(context).unfocus();
                }
              },
            );
          },
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemeStyle.themeType.colorType().secondary,
              ),
              onPressed: () {
                widget.onBackClick?.call();
              },
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: ThemeStyle.themeType.colorType().secondary,
              ),
              onPressed: () {
                controller.clear();
                widget.onTrashClick?.call();
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
