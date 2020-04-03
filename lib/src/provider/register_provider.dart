import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kandangapp/models/register_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';
import 'package:kandangapp/src/utils/base64_helper.dart';

class RegisterProvider {
  ApiBaseHelper _helper = ApiBaseHelper();
  RegisterResponseModel _registerResponseModel;

  Future<RegisterResponseModel> doRegister({
    @required String name,
    @required String email,
    @required String telp,
    @required String gender,
    @required String alamat,
    @required String password,
  }) async {   

    Map<String, String> _body = {
      'name': name,
      'email': email,
      'telp': telp,
      'gender': gender,
      'alamat': alamat,
      'password': Base64Helper.encode(password)
    };

    final response = await _helper.post("/api/user/register", body: _body);
    print(response.toString());
    return RegisterResponseModel.fromJson(response);
  }

}
