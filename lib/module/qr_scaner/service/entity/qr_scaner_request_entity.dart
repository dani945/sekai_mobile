class QrScanerRequestEntity {
  String namaToko;
  String namaBarang;
  String serialNumber;

  QrScanerRequestEntity({
    required this.namaToko,
    required this.namaBarang,
    required this.serialNumber,
  });

  factory QrScanerRequestEntity.fromJson(Map<String, dynamic> json) => QrScanerRequestEntity(
        namaToko: json["namaToko"],
        namaBarang: json["namaBarang"],
        serialNumber: json["serialNumber"],
      );

  Map<String, dynamic> toJson() => {
        "namaToko": namaToko,
        "namaBarang": namaBarang,
        "serialNumber": serialNumber,
      };
}
