import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tes_sekai/route/route.dart';

import '../../storage/i_storage.dart';
import '../../util/app_utils.dart';
import '../../util/i_constant.dart';
import '../home/home_view.dart';
import '../informasi_toko/informasi_toko_view.dart';
import 'service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(BuildContext context) {
    initPage(context);
  }

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool isVisiblePass = true;

  String? errorEmail;

  void initPage(BuildContext context) {}

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void tapVisiblePass() {
    isVisiblePass = !isVisiblePass;
    notifyListeners();
  }

  void toRegisterForm(BuildContext context) {
    goToNamed(context, routeName: InformasiTokoView.routeName, arguments: {
      "readonlyForm": false,
    });
  }

  Future<void> submitLogin(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
    });

    FocusManager.instance.primaryFocus?.unfocus();

    if (controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      if (AppUtils.isValidEmail(controllerEmail.text).isNotEmpty) {
        errorEmail = AppUtils.isValidEmail(controllerEmail.text);
        notifyListeners();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          EasyLoading.dismiss();
        });
        return;
      }

      var res = await LoginServices.postLogin(
        context,
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      if (res.response ?? false) {
        IStorage.setString(
          IConstant.cookiesUser,
          jsonEncode(res.data?.toJson()),
        );

        EasyLoading.dismiss();
        if (!context.mounted) return;
        goToNamed(context, routeName: HomeView.routeName, routeType: RouteType.pushRemove);
      } else {
        EasyLoading.dismiss();
      }
    } else {
      EasyLoading.dismiss();
      AppUtils.showSnackbar(context, message: "isikan username dan password");
    }
  }
}
