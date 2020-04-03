import 'package:flutter/material.dart';
import 'package:kandangapp/models/login_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';
import 'package:kandangapp/src/utils/base64_helper.dart';

class AuthProvider {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginResponseModel> doLogin({
    @required String email,
    @required String password,
  }) async {   

    Map<String, String> _body = {
      'email': email,
      'password': Base64Helper.encode(password),
      'firebase_hash': 'f'
    };

    Map<String, String> _header = {
      'email': email,
      'password': Base64Helper.encode(password),
      'firebase_hash': 'f'
    };

    final response = await _helper.post("/api/user/login", body: _body);
    
    return LoginResponseModel.fromJson(response);
  }
  
  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token-info';
  }

}
