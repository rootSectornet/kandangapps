class Data
{
    String name;
    String email;

    Data({this.name,this.email});

    factory Data.fromJson(Map<String, dynamic> json){
      return Data(
        name: json['name'],
        email: json['email']
      );
    }
}

class RegisterResponseModel
{
    int code;
    String message;
    Data data;

    RegisterResponseModel({this.code, this.message, this.data});

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json){
      return RegisterResponseModel(
        code: json['code'],
        message: json['message'],
        data: json['code'] == 200 ? Data.fromJson(json['data']) : null
      );
    }
}