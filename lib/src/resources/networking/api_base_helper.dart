import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:kandangapp/src/resources/networking/app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://kandangapp.com";

  Future<dynamic> get(String url, {Map<String, String> header}) async {
    
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, String> header, dynamic body}) async {
    
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, headers: header, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
    
      throw FetchDataException('No Internet connection');
    }
    
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      
      throw FetchDataException('No Internet connection');
    }
    
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    
    var apiResponse;
    try {
      final response = await http.delete(_baseUrl + url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      
      throw FetchDataException('No Internet connection');
    }
    
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}