import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tes_sekai/module/change_password/service/entity/change_password_request_entity.dart';
import 'package:tes_sekai/module/change_password/service/entity/change_password_response_entity.dart';

import '../../../util/i_constant.dart';

final dio = Dio();

class ChangePasswordServices {
  static Future<ChangePasswordResponseEntity> changePassword(
    BuildContext context, {
    required String idUser,
    required String password,
    bool isLoading = false,
  }) async {
    String url = "${IConstant.url}update_pass_mobile.php";

    if (isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );
      });
    }
    Response response;
    ChangePasswordRequestEntity body = ChangePasswordRequestEntity(
      idUser: idUser,
      password: password,
    );
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

    return ChangePasswordResponseEntity.fromJson(json.decode(response.data));
  }
}
