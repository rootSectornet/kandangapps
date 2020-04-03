import 'dart:convert';

class Base64Helper {
  static String base64HelperConvert = "";
  static Codec<String, String> stringToBase64 = utf8.fuse(base64);

  static encode(String value){  
    return base64HelperConvert = stringToBase64.encode(value);
  }

  static decode(String value){
    return base64HelperConvert = stringToBase64.decode(value);
  }

}