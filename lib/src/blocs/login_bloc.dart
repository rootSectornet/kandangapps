import 'package:kandangapp/models/login_response_model.dart';
import 'package:kandangapp/repositories/login_repository.dart';
import 'package:kandangapp/src/blocs/auth_bloc.dart';
import 'package:kandangapp/src/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Validators {
  LoginRepository repository = LoginRepository();
  LoginResponseModel loginResponseModel = LoginResponseModel();
  
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();
  final PublishSubject _loadingData = PublishSubject<bool>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true);
  Observable<bool> get loading => _loadingData.stream;

  void submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    _loadingData.sink.add(true);
    login(validEmail, validPassword);
  }

  login(String email, String password) async {
    loginResponseModel = await repository.login(email, password);
    String token = loginResponseModel.data;
    _loadingData.sink.add(false);
    authBloc.openSession(token);
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _loadingData.close();
  }
}
