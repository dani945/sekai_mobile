class InformasiTokoRequestEntity {
  String namaToko;
  String jenisToko;
  String noKtp;
  String namaPemilik;
  String alamatToko;
  String kodePos;
  String lokasiToko;
  String noTelp;
  String email;
  String kota;
  String password;

  InformasiTokoRequestEntity({
    required this.namaToko,
    required this.jenisToko,
    required this.noKtp,
    required this.namaPemilik,
    required this.alamatToko,
    required this.kodePos,
    required this.lokasiToko,
    required this.noTelp,
    required this.email,
    required this.kota,
    required this.password,
  });

  factory InformasiTokoRequestEntity.fromJson(Map<String, dynamic> json) => InformasiTokoRequestEntity(
        namaToko: json["namaToko"],
        jenisToko: json["jenisToko"],
        noKtp: json["noKtp"],
        namaPemilik: json["namaPemilik"],
        alamatToko: json["alamatToko"],
        kodePos: json["kodePos"],
        lokasiToko: json["lokasiToko"],
        noTelp: json["noTelp"],
        email: json["email"],
        kota: json["kota"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "namaToko": namaToko,
        "jenisToko": jenisToko,
        "noKtp": noKtp,
        "namaPemilik": namaPemilik,
        "alamatToko": alamatToko,
        "kodePos": kodePos,
        "lokasiToko": lokasiToko,
        "noTelp": noTelp,
        "email": email,
        "kota": kota,
        "password": password,
      };
}
