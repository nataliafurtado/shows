import 'package:design_system/atom/widgets/loading_center_widget.dart';
import 'package:design_system/layout/place_holder_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:entities/shows/show.dart';
import 'package:flutter/material.dart';
import 'package:packages/exports.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({
    Key? key,
    required this.show,
  }) : super(key: key);
  final Show show;

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeStyle.themeType.colorType().primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ThemeStyle.themeType.colorType().secondary,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        // color: Colors.amber,
        padding: EdgeInsets.all(sp.s8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: show.imageUrl,
              height: 300,
              fit: BoxFit.fitHeight,
              errorWidget: (context, url, error) => const PlaceHolderWidget(),
              progressIndicatorBuilder: (context, url, progress) =>
                  const LoadingCenterWidget(),
            ),
            SizedBox(
              height: sp.s4,
              width: double.infinity,
            ),
            Text(
              show.name,
              style: ThemeStyle.themeType.textType().l4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
