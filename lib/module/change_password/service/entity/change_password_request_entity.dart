class ChangePasswordRequestEntity {
  final String idUser;
  final String password;

  ChangePasswordRequestEntity({
    required this.idUser,
    required this.password,
  });

  factory ChangePasswordRequestEntity.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequestEntity(
      idUser: json['idUser'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'password': password,
    };
  }
}
