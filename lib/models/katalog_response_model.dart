class Informasi {
  int idInformasi;
  String idKatalogs;
  String title;
  String content;

  Informasi({this.idInformasi, this.idKatalogs, this.title, this.content});

  factory Informasi.fromJson(Map<String, dynamic> json) {
    return Informasi(
        idInformasi: json['id_informasi'],
        idKatalogs: json['id_katalogs'],
        title: json['title'],
        content: json['content']);
  }
}

class Katalog {
  int idKatalogs;
  String idKategori;
  String harga;
  String katalogName;
  String images;
  List<Informasi> informasi;

  Katalog(
      {this.idKatalogs,
      this.idKategori,
      this.harga,
      this.katalogName,
      this.images,
      this.informasi});

  factory Katalog.fromJson(Map<String, dynamic> json) {
    return Katalog(
        idKatalogs: json['id_katalogs'],
        idKategori: json['id_category'],
        harga: json['harga'],
        katalogName: json['katalog_name'],
        images: json['images'],
        informasi: parsedInformasi(json));
  }

  static List<Informasi> parsedInformasi(jsonInformasi) {
    var data = jsonInformasi['informasi'] as List;

    List<Informasi> informasiList =
        data.map((data) => Informasi.fromJson(data)).toList();
    return informasiList;
  }
}

class KatalogResponseModel {
  int code;
  String message;
  List<Katalog> data;
  int total;

  KatalogResponseModel({this.code, this.message, this.data, this.total});

  factory KatalogResponseModel.fromJson(Map<String, dynamic> json){
    return KatalogResponseModel(
      code: json['code'],
      message: json['message'],
      data: json['total'] != 0 ? parsedKatalog(json) : [],
    );
  }

  static List<Katalog> parsedKatalog(jsonKatalog) {
    var data = jsonKatalog['data'] as List;

    List<Katalog> katalogList = data.map((data) => Katalog.fromJson(data)).toList();
    return katalogList;
  }
}
