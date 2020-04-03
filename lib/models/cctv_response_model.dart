class CctvKandang
{
    int idCctv;
    String placeId;
    String name;
    String ip;

    CctvKandang({this.idCctv, this.placeId, this.name, this.ip});

    factory CctvKandang.fromJson(Map<String, dynamic> json){
      return CctvKandang(
        idCctv: json['id_cctv'],
        placeId: json['place_id'],
        name: json['name'],
        ip: json['ip']
      );
    }
}

class CctvKandangResponseMdel
{
    int code;
    String message;
    List<CctvKandang> data;

    CctvKandangResponseMdel({this.code, this.message, this.data});

    factory CctvKandangResponseMdel.fromJson(Map<String, dynamic> json){
      return CctvKandangResponseMdel(
        code: json['code'],
        message: json['message'],
        data: parsedCctv(json)
      );
    }

    static List<CctvKandang> parsedCctv(jsonCctv) {
    var data = jsonCctv['data'] as List;

    List<CctvKandang> cctvList = data.map((data) => CctvKandang.fromJson(data)).toList();
    return cctvList;
  }
}