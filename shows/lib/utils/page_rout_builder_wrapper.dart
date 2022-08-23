import 'package:flutter/material.dart';
import 'package:packages/exports.dart';
import 'package:shows/utils/im.dart';

class PageRouteBuilderWrapper extends StatefulWidget {
  final Widget child;
  final String path;
  const PageRouteBuilderWrapper(
    this.child,
    this.path, {
    Key? key,
  }) : super(key: key);

  @override
  _PageRouteBuilderWrapperState createState() =>
      _PageRouteBuilderWrapperState();
}

class _PageRouteBuilderWrapperState extends State<PageRouteBuilderWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    GetIt.I.get<IM>().resetInstances(widget.path);
  }
}
