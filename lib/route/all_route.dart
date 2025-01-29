import 'dart:developer';

import 'package:tes_sekai/route/app_route.dart';

import 'base_route.dart';

class AllRoute {
  static Map<String, BaseRoute> allRouteMap = {};

  List<BaseRoute> allRoute = [
    ...AppRoute.listRoute,
  ];

  void getKey() {
    if (allRouteMap.isNotEmpty) {
      return;
    }
    log("execute MAPPING");
    for (var e in allRoute) {
      allRouteMap[e.routeName] = e;
    }

    log("executed MAPPING");
  }
}
