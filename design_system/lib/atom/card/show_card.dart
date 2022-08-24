import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    const double ratio = 59 / 42;
    const double width = 150.0;
    const double height = width * ratio;

    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(sp.s2)),
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: height,
              errorWidget: (context, url, error) => const PlaceHolderWidget(),
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ThemeStyle.themeType.colorType().primary,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                color:
                    ThemeStyle.themeType.colorType().primary.withOpacity(0.5),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(sp.s2),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
