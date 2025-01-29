import '../../../login/service/entity/login_response_entity.dart';

class ChangePasswordResponseEntity {
  bool? response;
  String? message;
  DataLogin? data;

  ChangePasswordResponseEntity({
    this.response,
    this.message,
    this.data,
  });

  factory ChangePasswordResponseEntity.fromJson(Map<String, dynamic> json) => ChangePasswordResponseEntity(
        response: json["Response"],
        message: json["Message"],
        data: json['Data'] != null ? DataLogin.fromJson(json['Data']) : null,
      );

  Map<String, dynamic> toJson() => {
        "Response": response,
        "Message": message,
        "Data": data,
      };
}
