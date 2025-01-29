class InformasiTokoResponseEntity {
  bool? response;
  String? message;

  InformasiTokoResponseEntity({
    this.response,
    this.message,
  });

  factory InformasiTokoResponseEntity.fromJson(Map<String, dynamic> json) => InformasiTokoResponseEntity(
        response: json["Response"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Response": response,
        "Message": message,
      };
}

class DataLogin {
  String? id;
  String? nama;
  String? email;
  String? namaToko;
  String? jenisToko;
  String? noKtp;
  String? alamatToko;
  String? kodePos;
  String? lokasiToko;
  String? noTelp;
  String? password;
  String? createdAt;
  String? flag;

  DataLogin({this.id, this.nama, this.email, this.namaToko, this.jenisToko, this.noKtp, this.alamatToko, this.kodePos, this.lokasiToko, this.noTelp, this.password, this.createdAt, this.flag});

  DataLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    namaToko = json['nama_toko'];
    jenisToko = json['jenis_toko'];
    noKtp = json['no_ktp'];
    alamatToko = json['alamat_toko'];
    kodePos = json['kode_pos'];
    lokasiToko = json['lokasi_toko'];
    noTelp = json['no_telp'];
    password = json['password'];
    createdAt = json['created_at'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['nama_toko'] = this.namaToko;
    data['jenis_toko'] = this.jenisToko;
    data['no_ktp'] = this.noKtp;
    data['alamat_toko'] = this.alamatToko;
    data['kode_pos'] = this.kodePos;
    data['lokasi_toko'] = this.lokasiToko;
    data['no_telp'] = this.noTelp;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['flag'] = this.flag;
    return data;
  }
}
