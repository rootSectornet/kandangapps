class Kandang
{
    int placeId;
    String placeName;
    String placePicture;
    String latitude;
    String longitude;

    Kandang({this.placeId, this.placeName, this.placePicture, this.latitude, this.longitude});

    factory Kandang.fromJson(Map<String, dynamic> json) {
      return Kandang(
        placeId: json['place_id'],
        placeName: json['place_name'],
        placePicture: json['place_picture'],
        latitude: json['latitude'],
        longitude: json['longitude']
      );
    }
}

class KandangResponseModel
{
    int code;
    String message;
    List<Kandang> data;
    int total;

    KandangResponseModel({this.code, this.message, this.data, this.total});

    factory KandangResponseModel.fromJson(Map<String, dynamic> json){
      return KandangResponseModel(
        code: json['code'],
        message: json['message'],
        data: json['code'] == 200 ? parsedKandang(json) : null,
        total: json['total']
      );
    }

    static List<Kandang> parsedKandang(jsonKandang){
      var data = jsonKandang['data'] as List;

      List<Kandang> kandangList = data.map((data) => Kandang.fromJson(data)).toList();
      return kandangList;
    }
}