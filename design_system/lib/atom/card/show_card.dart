import 'package:design_system/atom/card/show_card_column.dart';
import 'package:design_system/atom/card/show_card_stack.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onClick,
    required this.ratio,
    required this.width,
    required this.isToTextOverflowCard,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final VoidCallback onClick;
  final double ratio;
  final double width;
  final bool isToTextOverflowCard;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    double height = width * ratio;
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(sp.s2)),
          child: isToTextOverflowCard
              ? ShowCardStack(
                  imageUrl: imageUrl,
                  height: height,
                  width: width,
                  name: name,
                )
              : ShowCardColumn(
                  imageUrl: imageUrl,
                  height: height,
                  width: width,
                  name: name,
                ),
        ),
      ),
    );
  }
}
