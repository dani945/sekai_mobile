import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tes_sekai/module/login/login_view.dart';
import 'package:tes_sekai/util/router_extensions.dart';

import '../../route/route.dart';
import '../../storage/i_storage.dart';
import '../../util/app_utils.dart';
import '../../util/i_constant.dart';
import '../login/service/entity/login_response_entity.dart';
import 'service/entity/informasi_toko_request_entity.dart';
import 'service/informasi_toko_service.dart';

class InformasiTokoViewModel extends ChangeNotifier {
  InformasiTokoViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  TextEditingController controllerNamaToko = TextEditingController();
  TextEditingController controllerJenisToko = TextEditingController();
  TextEditingController controllerNoKtp = TextEditingController();
  TextEditingController controllerNamaPemilik = TextEditingController();
  TextEditingController controllerAlamatToko = TextEditingController();
  TextEditingController controllerKodePos = TextEditingController();
  TextEditingController controllerLokasiToko = TextEditingController();
  TextEditingController controllerNoTelp = TextEditingController();
  TextEditingController controllerKota = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerKonfirmasi = TextEditingController();

  bool readonlyForm = true;
  bool isVisiblePass = true;
  bool isVisiblePassKonfirmasi = true;
  bool submitButton = false;
  String? errorEmail;

  String? erorrTextPass;
  String? erorrTextPassKonfirmasi;

  DataLogin? user;

  @override
  void dispose() {
    controllerNamaToko.dispose();
    controllerJenisToko.dispose();
    controllerNoKtp.dispose();
    controllerNamaPemilik.dispose();
    controllerAlamatToko.dispose();
    controllerKodePos.dispose();
    controllerLokasiToko.dispose();
    controllerNoTelp.dispose();
    controllerKota.dispose();
    controllerEmail.dispose();
    controllerPass.dispose();
    controllerKonfirmasi.dispose();
    super.dispose();
  }

  void initPage(BuildContext context) {
    getArgument(context);
    if (readonlyForm) {
      getDataUser();
    }
  }

  void getArgument(BuildContext context) {
    final arg = context.argumentsMap;
    if (arg != null) {
      readonlyForm = arg["readonlyForm"];
      notifyListeners();
    }
  }

  void tapVisiblePassBaru() {
    isVisiblePass = !isVisiblePass;
    notifyListeners();
  }

  void tapVisiblePassKonfirmasi() {
    isVisiblePassKonfirmasi = !isVisiblePassKonfirmasi;
    notifyListeners();
  }

  Future<void> getDataUser() async {
    final userLocal = jsonDecode(await IStorage.getString(IConstant.cookiesUser) ?? "");
    user = DataLogin.fromJson(userLocal);
    controllerNamaToko.text = user?.namaToko ?? "";
    controllerJenisToko.text = user?.jenisToko ?? "";
    controllerNoKtp.text = user?.noKtp ?? "";
    controllerNamaPemilik.text = user?.nama ?? "";
    controllerAlamatToko.text = user?.alamatToko ?? "";
    controllerKodePos.text = user?.kodePos ?? "";
    controllerLokasiToko.text = user?.lokasiToko ?? "";
    controllerNoTelp.text = user?.noTelp ?? "";
    controllerKota.text = user?.kota ?? "";
    controllerEmail.text = user?.email ?? "";
    notifyListeners();
  }

  void validasiForm() {
    if (controllerNamaToko.text.isNotEmpty &&
        controllerJenisToko.text.isNotEmpty &&
        controllerNoKtp.text.isNotEmpty &&
        controllerNamaPemilik.text.isNotEmpty &&
        controllerAlamatToko.text.isNotEmpty &&
        controllerKodePos.text.isNotEmpty &&
        controllerLokasiToko.text.isNotEmpty &&
        controllerNoTelp.text.isNotEmpty &&
        controllerKota.text.isNotEmpty &&
        controllerEmail.text.isNotEmpty &&
        controllerPass.text.isNotEmpty &&
        controllerKonfirmasi.text.isNotEmpty) {
      submitButton = true;
      notifyListeners();
    } else {
      submitButton = false;
      notifyListeners();
    }
  }

  Future<void> editAction(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (AppUtils.isValidEmail(controllerEmail.text).isNotEmpty) {
      errorEmail = AppUtils.isValidEmail(controllerEmail.text);
      notifyListeners();
      return;
    }

    if (controllerPass.text != controllerKonfirmasi.text) {
      erorrTextPassKonfirmasi = "Password Konfirmasi Salah";
      notifyListeners();
      return;
    }

    var res = await InformasiTokoServices.buatAkun(
      context,
      isLoading: true,
      informasiTokoRequestEntity: InformasiTokoRequestEntity(
        namaToko: controllerNamaToko.text,
        jenisToko: controllerJenisToko.text,
        noKtp: controllerNoKtp.text,
        namaPemilik: controllerNamaPemilik.text,
        alamatToko: controllerAlamatToko.text,
        kodePos: controllerKodePos.text,
        lokasiToko: controllerLokasiToko.text,
        noTelp: controllerNoTelp.text,
        email: controllerEmail.text,
        kota: controllerKota.text,
        password: controllerPass.text,
      ),
    );
    if (res.response ?? false) {
      if (!context.mounted) return;
      AppUtils.showSnackbar(context, message: res.message ?? "");
      goToNamed(context, routeName: LoginView.routeName, routeType: RouteType.pushRemove);
    }
  }
}
