import 'package:flutter/material.dart';

class BaseRoute {
  String routeName;
  Widget clazz;

  BaseRoute({
    required this.routeName,
    required this.clazz,
  });
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?>? navigateTo<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
}