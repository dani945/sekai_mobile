import 'package:flutter/material.dart';

import '../module/home/home_view.dart';
import 'all_route.dart';

enum RouteType { push, pushReplace, pushRemove }

const initialRoute = HomeView.routeName;
// const initialRoute = Aktifasi.routeName;

//====GENERATE ROUTES====
Route<dynamic>? generateRoutes(RouteSettings settings) {
  // switch (settings.name) {
  //   case ExamplePage.routeName:
  //     return MaterialPageRoute(
  //       builder: (context) =>  const ExamplePage(),
  //       settings: settings,
  //     );
  //   default:
  //     return null;
  // }

  return MaterialPageRoute(
    builder: (context) => AllRoute.allRouteMap[settings.name]?.clazz ?? const SizedBox(),
    settings: settings,
  );
  // switch (settings.name) {
  //   case ExamplePage.routeName:
  //     return MaterialPageRoute(
  //       builder: (context) =>  const ExamplePage(),
  //       settings: settings,
  //     );
  //   default:
  //     return null;
  // }
}

//====GO TO PAGE====

///default navigator adalah pushNamed silakan isi RouteType susuai
///dengan yang diinginkan
Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(context, routeName, arguments: arguments, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}

///default navigator adalah push silakan isi RouteType susuai
///dengan yang diinginkan
Future goTo(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

///default navigator adalah push silakan isi RouteType susuai
///dengan yang diinginkan
Future goToSlide(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: page,
      );
    },
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}
