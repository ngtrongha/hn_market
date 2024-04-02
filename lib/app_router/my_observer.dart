import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    if (EasyLoading.isShow) EasyLoading.dismiss();
  }

  @override
  void didPush(Route route, Route? previousRoute) {}
}
