import 'package:kandangapp/models/login_response_model.dart';
import 'package:kandangapp/src/provider/auth_provider.dart';

class LoginRepository {
  final AuthProvider authProvider = AuthProvider();

  Future<LoginResponseModel> login(String email, String password) =>
      authProvider.doLogin(email: email, password: password);
}
