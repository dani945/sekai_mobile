import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tes_sekai/module/qr_scaner/qr_scaner_view.dart';

import '../../route/route.dart';
import '../../storage/i_storage.dart';
import '../../util/i_constant.dart';
import '../informasi_toko/service/entity/informasi_toko_response_entity.dart';

class BarcodeScannerViewModel extends ChangeNotifier {
  BarcodeScannerViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  TextEditingController controllerNamaBarang = TextEditingController();

  bool submitButton = false;

  DataLogin? user;

  @override
  void dispose() {
    controllerNamaBarang.dispose();
    super.dispose();
  }

  void initPage(BuildContext context) {
    getDataUser();
  }

  Future<void> getDataUser() async {
    final userLocal = jsonDecode(await IStorage.getString(IConstant.cookiesUser) ?? "");
    user = DataLogin.fromJson(userLocal);
    notifyListeners();
  }

  void toQrScannerPage(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    goToNamed(context, routeName: QrScanerView.routeName, arguments: {
      "namaToko": user?.namaToko ?? "",
      "namaBarang": controllerNamaBarang.text,
    });
  }

  void validasiForm() {
    submitButton = controllerNamaBarang.text.isNotEmpty;
    notifyListeners();
  }
}
