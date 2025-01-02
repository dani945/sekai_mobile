import 'package:flutter/material.dart';

import '../../route/route.dart';

extension RouterExtension on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<dynamic> go(
    Widget page, {
    RouteType? routeType,
    Object? arguments,
  }) =>
      goTo(
        this,
        page: page,
        arguments: arguments,
        routeType: routeType,
      );

  Future<dynamic> goNamed(
    String routeName, {
    RouteType? routeType,
    Object? arguments,
  }) =>
      goToNamed(
        this,
        routeName: routeName,
        arguments: arguments,
        routeType: routeType,
      );

  Future<dynamic> slide(
    Widget page, {
    RouteType? routeType,
    Object? arguments,
  }) =>
      goToSlide(
        this,
        page: page,
        arguments: arguments,
        routeType: routeType,
      );

  void popUntil(String routeName) => Navigator.of(this).popUntil(ModalRoute.withName(routeName));

  Object? get arguments => ModalRoute.of(this)?.settings.arguments;

  Map<String, dynamic>? get argumentsMap {
    var args = ModalRoute.of(this)?.settings.arguments;
    if (args is Map<String, dynamic>?) return args;
    return null;
  }
}
