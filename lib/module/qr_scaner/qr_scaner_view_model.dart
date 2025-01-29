import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tes_sekai/module/qr_scaner/service/entity/qr_scaner_request_entity.dart';
import 'package:tes_sekai/module/qr_scaner/service/qr_scaner_service.dart';
import 'package:tes_sekai/util/app_utils.dart';
import 'package:tes_sekai/util/router_extensions.dart';

class QrScanerViewModel extends ChangeNotifier {
  QrScanerViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String namaToko = "";
  String namaBarang = "";

  void initPage(BuildContext context) {
    getArgument(context);
  }

  void getArgument(BuildContext context) {
    final arg = context.argumentsMap;
    if (arg != null) {
      namaToko = arg["namaToko"];
      namaBarang = arg["namaBarang"];
      notifyListeners();
    }
  }

  void onQRViewCreated(BuildContext context, QRViewController controllerQr) {
    controllerQr.scannedDataStream.listen((scanData) {
      if (scanData.code?.isNotEmpty == true) {
        controllerQr.pauseCamera();
        simpanBarangScan(context, serialNumber: scanData.code ?? "");
      }
    });
  }

  Future<void> simpanBarangScan(BuildContext context, {required String serialNumber}) async {
    var res = await QrScanerServices.inputBarang(
      context,
      qrScanerRequestEntity: QrScanerRequestEntity(
        namaToko: namaToko,
        namaBarang: namaBarang,
        serialNumber: serialNumber,
      ),
    );
    if (res.response ?? false) {
      if (!context.mounted) return;
      AppUtils.showSnackbar(context, message: res.message ?? "");
      Navigator.pop(context);
    } else {
      if (!context.mounted) return;
      AppUtils.showSnackbar(context, message: res.message ?? "");
      Navigator.pop(context);
    }
  }
}
