import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onClick,
    required this.ratio,
    required this.width,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final VoidCallback onClick;
  final double ratio;
  final double width;

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
          child: Stack(
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
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  color:
                      ThemeStyle.themeType.colorType().primary.withOpacity(0.6),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(sp.s2),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
