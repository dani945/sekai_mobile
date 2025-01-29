import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../util/i_constant.dart';
import 'entity/informasi_toko_request_entity.dart';
import 'entity/informasi_toko_response_entity.dart';

final dio = Dio();

class InformasiTokoServices {
  static Future<InformasiTokoResponseEntity> buatAkun(
    BuildContext context, {
    required InformasiTokoRequestEntity informasiTokoRequestEntity,
    bool isLoading = false,
  }) async {
    String url = "${IConstant.url}buat_akun.php";

    if (isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );
      });
    }
    Response response;
    InformasiTokoRequestEntity body = informasiTokoRequestEntity;
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

    return InformasiTokoResponseEntity.fromJson(json.decode(response.data));
  }
}
