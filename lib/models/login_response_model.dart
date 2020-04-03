
class LoginResponseModel{
    int code;
    String message;
    String data;

    LoginResponseModel({
      this.code, this.message, this.data
    });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      code: json['code'],
      message: json['message'],
      data: json['code'] == 200 ? json['data'] : null
    );
  }
}