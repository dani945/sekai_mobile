import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tes_sekai/module/change_password/service/change_password_service.dart';
import 'package:tes_sekai/module/home/home_view.dart';
import 'package:tes_sekai/route/route.dart';
import 'package:tes_sekai/util/app_utils.dart';

import '../../storage/i_storage.dart';
import '../../util/i_constant.dart';
import '../login/service/entity/login_response_entity.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  ChangePasswordViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController controllerPassLama = TextEditingController();
  TextEditingController controllerPassBaru = TextEditingController();
  TextEditingController controllerKonfirmasi = TextEditingController();

  bool isVisiblePassLama = true;
  bool isVisiblePassBaru = true;
  bool isVisiblePassKonfirmasi = true;

  String? erorrTextPassLama;
  String? erorrTextPassBaru;
  String? erorrTextPassKonfirmasi;

  DataLogin? user;

  @override
  void dispose() {
    controllerPassLama.dispose();
    controllerPassBaru.dispose();
    controllerKonfirmasi.dispose();
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

  void tapVisiblePassLama() {
    isVisiblePassLama = !isVisiblePassLama;
    notifyListeners();
  }

  void tapVisiblePassBaru() {
    isVisiblePassBaru = !isVisiblePassBaru;
    notifyListeners();
  }

  void tapVisiblePassKonfirmasi() {
    isVisiblePassKonfirmasi = !isVisiblePassKonfirmasi;
    notifyListeners();
  }

  void validasiOnchangePassLama() {
    if (controllerPassLama.text.isNotEmpty) {
      if (AppUtils.generateToSHA1(value: controllerPassLama.text) != user?.password) {
        erorrTextPassLama = "Password Lama Anda Salah";
        notifyListeners();
      } else {
        erorrTextPassLama = null;
        notifyListeners();
      }
    }
  }

  Future<void> submitSimpan(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    validasiOnchangePassLama();

    if (controllerPassBaru.text.isEmpty && controllerKonfirmasi.text.isEmpty) {
      erorrTextPassBaru = "Field Tidak Boleh Kosong";
      erorrTextPassKonfirmasi = "Field Tidak Boleh Kosong";
      notifyListeners();
    } else if (controllerPassBaru.text != controllerKonfirmasi.text) {
      erorrTextPassKonfirmasi = "Password Tidak Sama dengan password baru";
      notifyListeners();
    } else if (erorrTextPassLama == null && controllerPassBaru.text.isNotEmpty && controllerKonfirmasi.text.isNotEmpty && (controllerPassBaru.text == controllerKonfirmasi.text)) {
      erorrTextPassBaru = null;
      erorrTextPassKonfirmasi = null;
      var res = await ChangePasswordServices.changePassword(
        context,
        isLoading: true,
        idUser: user?.id ?? "",
        password: AppUtils.generateToSHA1(value: controllerPassBaru.text),
      );
      if (res.response ?? false) {
        IStorage.setString(
          IConstant.cookiesUser,
          jsonEncode(res.data?.toJson()),
        );

        if (!context.mounted) return;
        AppUtils.showSnackbar(context, message: res.message ?? "");
        goToNamed(context, routeName: HomeView.routeName);
      } else {
        if (!context.mounted) return;
        AppUtils.showSnackbar(context, message: res.message ?? "");
      }
    }
  }
}
