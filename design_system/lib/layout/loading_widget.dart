import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingWidget({
    Key? key,
    required this.child,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Visibility(
          visible: isLoading,
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ThemeStyle.themeType.colorType().secondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
