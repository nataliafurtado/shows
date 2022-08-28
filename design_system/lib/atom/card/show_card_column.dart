import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class ShowCardColumn extends StatelessWidget {
  const ShowCardColumn({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  final double height;
  final double width;
  final String name;
  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Column(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          errorWidget: (context, url, error) => const PlaceHolderWidget(),
          progressIndicatorBuilder: (context, url, progress) =>
              const LoadingCenterWidget(
            height: 25,
            width: 25,
          ),
        ),
        Container(
          width: width,
          height: 51,
          color: ThemeStyle.themeType.colorType().primary,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(sp.s2),
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
