import 'package:tes_sekai/module/barcode_scan/barcode_scan_view.dart';
import 'package:tes_sekai/module/home/home_view.dart';

import '../module/change_password/change_password_view.dart';
import '../module/informasi_toko/informasi_toko_view.dart';
import '../module/login/login_view.dart';
import '../module/qr_scaner/qr_scaner_view.dart';
import 'base_route.dart';

class AppRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: LoginView.routeName,
      clazz: const LoginView(),
    ),
    BaseRoute(
      routeName: HomeView.routeName,
      clazz: const HomeView(),
    ),
    BaseRoute(
      routeName: InformasiTokoView.routeName,
      clazz: const InformasiTokoView(),
    ),
    BaseRoute(
      routeName: ChangePasswordView.routeName,
      clazz: const ChangePasswordView(),
    ),
    BaseRoute(
      routeName: BarcodeScannerView.routeName,
      clazz: const BarcodeScannerView(),
    ),
    BaseRoute(
      routeName: QrScanerView.routeName,
      clazz: const QrScanerView(),
    ),
  ];
}
