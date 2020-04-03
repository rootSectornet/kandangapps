class ProfileModel {
  int idUser;
  String name;
  String foto;
  String email;
  String telp;
  String gender;
  String alamat;
  String password;
  String active;
  String firebaseHash;
  String rememberToken;
  String apiToken;
  String createdAt;
  String updatedAt;

  ProfileModel (
      {this.idUser,
      this.name,
      this.foto,
      this.email,
      this.telp,
      this.gender,
      this.alamat,
      this.password,
      this.active,
      this.firebaseHash,
      this.rememberToken,
      this.apiToken,
      this.createdAt,
      this.updatedAt
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      idUser: json['iduser'],
      name: json['name'],
      foto: json['foto'],
      email: json['email'],
      telp: json['telp'],
      gender: json['gender'],
      alamat: json['alamat'],
      password: json['password'],
      active: json['active'],
      firebaseHash: json['firebase_hash'],
      rememberToken: json['remember_token'],
      apiToken: json['api_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
    );
  }
}

class ProfileResponseModel {
  int code;
  String message;
  ProfileModel data;

  ProfileResponseModel({this.code, this.message, this.data});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json){
    return ProfileResponseModel(
      code: json['code'],
      message: json['message'],
      data: ProfileModel.fromJson(json['data'])    
    );
  }

}
