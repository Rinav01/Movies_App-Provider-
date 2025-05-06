import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  // Future<void> showDialog(BuildContext? context, Widget widget) async {
  //   await showAdaptiveDialog(
  //     context: context ?? navigatorKey.currentContext!,
  //     builder: (context) => widget,
  //   );
  // }
}
