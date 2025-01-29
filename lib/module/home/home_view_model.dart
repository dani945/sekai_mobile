import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tes_sekai/module/barcode_scan/barcode_scan_view.dart';
import 'package:tes_sekai/module/change_password/change_password_view.dart';
import 'package:tes_sekai/module/informasi_toko/informasi_toko_view.dart';
import 'package:tes_sekai/module/login/login_view.dart';

import '../../route/route.dart';
import '../../storage/i_storage.dart';
import '../../util/i_constant.dart';
import '../login/service/entity/login_response_entity.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  DataLogin? user;

  void initPage(BuildContext context) {
    getDataUser();
  }

  Future<void> getDataUser() async {
    final userLocal = jsonDecode(await IStorage.getString(IConstant.cookiesUser) ?? "");
    user = DataLogin.fromJson(userLocal);
    notifyListeners();
  }

  void toInformasiToko(BuildContext context) {
    goToNamed(context, routeName: InformasiTokoView.routeName);
  }

  void toChangePassword(BuildContext context) {
    goToNamed(context, routeName: ChangePasswordView.routeName);
  }

  void toBarcodeScanner(BuildContext context) {
    goToNamed(context, routeName: BarcodeScannerView.routeName);
  }

  Future<void> logout(BuildContext context) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    Future.delayed(
      const Duration(seconds: 2),
      () {
        IStorage.removeKey(IConstant.cookiesUser);
        if (!context.mounted) return;
        goToNamed(
          context,
          routeName: LoginView.routeName,
          routeType: RouteType.pushRemove,
        );

        EasyLoading.dismiss();
      },
    );
  }
}
