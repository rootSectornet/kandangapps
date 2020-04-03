import 'dart:async';

class Validators {
  
  var validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if(name.length == 0){
        sink.addError("Nama belum diisi");
      } else {
        sink.add(name);
      }
    }
  );

  var validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.length == 0){
        sink.addError("Email belum diisi");
      } else if(!email.contains("@")){
        sink.addError("Email tidak valid");
      } else {
        sink.add(email);
      }
    }
  );

  var validatePhoneNumber = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink){
      String phonePatttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(phonePatttern);
      if (phone.length == 0) {
        sink.addError('Telepon belum diisi');
      } else if (!regExp.hasMatch(phone)) {
        sink.addError('Nomer telepon tidak valid setidaknya 10 s/d 12 digit');
      } else {
        sink.add(phone);
      }
    }
  );

  var validateGender = StreamTransformer<String, String>.fromHandlers(
    handleData: (gender, sink){
      if(gender.length == 0){
        sink.addError("Gender belum dipilih");
      } else {
        sink.add(gender);
      }
    }
  );

  var validateAlamat = StreamTransformer<String, String>.fromHandlers(
    handleData: (alamat, sink){
      if(alamat.length == 0){
        sink.addError("Alamat belum diisi");
      } else {
        sink.add(alamat);
      }
    }
  );

  var validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length >= 6){
        sink.add(password);
      } else {
        sink.addError("Password harus lebih dari 6 karakter");
      }
    }
  );
}