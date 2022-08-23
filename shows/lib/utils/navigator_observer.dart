import 'package:flutter/material.dart';
import 'package:shows/utils/im.dart';
import 'package:packages/exports.dart';

class NavigatorObserverBot extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      GetIt.I.get<IM>().loadPagePath(route.settings.name!);
    }
  }
}
