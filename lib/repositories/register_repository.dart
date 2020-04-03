import 'package:kandangapp/models/register_response_model.dart';
import 'package:kandangapp/src/provider/register_provider.dart';

class RegisterRepository {
  final RegisterProvider registerProvider = RegisterProvider();

  Future<RegisterResponseModel> register(String name, String email, String telp,
          String gender, String alamat, String password) =>
      registerProvider.doRegister(
          name: name,
          email: email,
          telp: telp,
          gender: gender,
          alamat: alamat,
          password: password);
}
