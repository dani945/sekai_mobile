import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../util/i_constant.dart';
import 'entity/login_request_entity.dart';
import 'entity/login_response_entity.dart';

final dio = Dio();

class LoginServices {
  static Future<LoginResponseEntity> postLogin(
    BuildContext context, {
    required String email,
    required String password,
    bool isLoading = false,
  }) async {
    String url = "${IConstant.url}login_mobile.php";

    if (isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );
      });
    }
    Response response;
    LoginRequestEntity body = LoginRequestEntity(
      email: email,
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

    return LoginResponseEntity.fromJson(json.decode(response.data));
  }
}
