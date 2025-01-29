import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tes_sekai/module/qr_scaner/service/entity/qr_scaner_request_entity.dart';
import 'package:tes_sekai/module/qr_scaner/service/entity/qr_scaner_response_entity.dart';

import '../../../util/i_constant.dart';

final dio = Dio();

class QrScanerServices {
  static Future<QrScanerResponseEntity> inputBarang(
    BuildContext context, {
    required QrScanerRequestEntity qrScanerRequestEntity,
    bool isLoading = false,
  }) async {
    String url = "${IConstant.url}insert_barang.php";

    if (isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );
      });
    }
    Response response;
    QrScanerRequestEntity body = qrScanerRequestEntity;
    if (kDebugMode) {
      log("Request ($url) => ${body.toJson()}");
    }

    response = await dio.post(url, data: FormData.fromMap(body.toJson()));
    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 1));
      if (isLoading) {
        if (context.mounted) {
          EasyLoading.dismiss();
          isLoading = false;
        }
      }
      if (kDebugMode) {
        log("Response ($url) => ${response.data}");
      }
    }

    return QrScanerResponseEntity.fromJson(json.decode(response.data));
  }
}
