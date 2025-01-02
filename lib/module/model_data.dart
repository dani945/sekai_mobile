class ModelData {
  int id;
  String judulTugas;
  String deskripsi;
  String tanggalJatuhTempo;
  String category;
  String status;

  ModelData({
    required this.id,
    required this.judulTugas,
    required this.deskripsi,
    required this.tanggalJatuhTempo,
    required this.category,
    required this.status,
  });

  factory ModelData.fromJson(Map<dynamic, dynamic> json) => ModelData(
        id: json["id"],
        judulTugas: json["judulTugas"],
        deskripsi: json["deskripsi"],
        tanggalJatuhTempo: json["tanggalJatuhTempo"],
        category: json["category"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "judulTugas": judulTugas,
        "deskripsi": deskripsi,
        "tanggalJatuhTempo": tanggalJatuhTempo,
        "category": category,
        "status": status,
      };
}
