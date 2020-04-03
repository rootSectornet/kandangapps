import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationBloc {

  String _tokenString = "";
  final PublishSubject _theToken = PublishSubject<String>();
  Observable<String> get theToken => _theToken.stream;

  final PublishSubject _isSessionValid = PublishSubject<bool>();
  Observable<bool> get isSessionValid => _isSessionValid.stream;
  
  void dispose() {
    _isSessionValid.close();
    _theToken.close();
  }

  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get("token");
    if (_tokenString != null && _tokenString.length > 0) {
      _isSessionValid.sink.add(true);
      _theToken.sink.add(_tokenString);
    } else {
      _isSessionValid.sink.add(false);
      _theToken.sink.add(null);
    }
  }

  void openSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    _tokenString = token;
    _isSessionValid.sink.add(true);
  }

  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    _isSessionValid.sink.add(false);
  }
}

final authBloc = AuthorizationBloc();
