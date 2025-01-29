import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'route/all_route.dart';
import 'route/base_route.dart';
import 'route/route.dart';
import 'route/route_observer.dart';
import 'storage/i_storage.dart';
import 'theme/i_theme.dart';
import 'util/i_constant.dart';

Future<void> main() async {
  AllRoute().getKey();
  WidgetsFlutterBinding.ensureInitialized();

  var theme = await IStorage.getString(IConstant.themeMode);
  runApp(
    ChangeNotifierProvider(
      create: (context) => IThemeController()..init(theme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<IThemeController>(
      builder: (context, provider, child) {
        return _buildMaterial(context);
      },
    );
  }

  Widget _buildMaterial(BuildContext context) {
    var theme = context.read<IThemeController>();
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Tes Pilarmedia Indonesia",
      onGenerateRoute: generateRoutes,
      initialRoute: initialRoute,
      // initialRoute: ComponentPage.routeName,
      theme: theme.themeDataLight,
      darkTheme: theme.themeDataDark,
      themeMode: ThemeMode.light,
      navigatorObservers: [
        IRouteObserver(),
      ],
      builder: EasyLoading.init(),
    );
  }
}
