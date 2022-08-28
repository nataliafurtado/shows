import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.url,
    required this.height,
  }) : super(key: key);
  final String url;
  final double height;
  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(sp.s2),
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        width: height,
        fit: BoxFit.fitHeight,
        errorWidget: (context, url, error) => const PlaceHolderWidget(),
        progressIndicatorBuilder: (context, url, progress) =>
            const LoadingCenterWidget(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
