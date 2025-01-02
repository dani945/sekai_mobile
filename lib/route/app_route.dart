import 'package:tes_pilarmedia_indonesia/module/buat_task/buat_task_view.dart';
import 'package:tes_pilarmedia_indonesia/module/home/home_view.dart';

import 'base_route.dart';

class AppRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: HomeView.routeName,
      clazz: const HomeView(),
    ),
    BaseRoute(
      routeName: BuatTaskView.routeName,
      clazz: const BuatTaskView(),
    ),
  ];
}
