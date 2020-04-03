import 'package:fluttertoast/fluttertoast.dart';
import 'package:kandangapp/models/register_response_model.dart';
import 'package:kandangapp/repositories/register_repository.dart';
import 'package:kandangapp/src/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Validators {
  RegisterRepository repository = RegisterRepository();
  RegisterResponseModel registerResponseModel = RegisterResponseModel();

  final PublishSubject _theMessage = PublishSubject<String>();
  Observable<String> get theToken => _theMessage.stream;

  final BehaviorSubject _nameController = BehaviorSubject<String>();
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _telpController = BehaviorSubject<String>();
  final BehaviorSubject _genderController = BehaviorSubject<String>();
  final BehaviorSubject _alamatController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();
  final PublishSubject _loadingData = PublishSubject<bool>();

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeTelp => _telpController.sink.add;
  Function(String) get changeGender => _genderController.sink.add;
  Function(String) get changeAlamat => _alamatController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get name => _nameController.stream.transform(validateName);
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get telp => _telpController.stream.transform(validatePhoneNumber);
  Stream<String> get gender => _genderController.stream.transform(validateGender);
  Stream<String> get alamat => _alamatController.stream.transform(validateAlamat);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest6(
      name, email, telp, gender, alamat, password, (name, email, telp, gender, alamat, password) => true);
  Observable<bool> get loading => _loadingData.stream;

  void submit() {
    final validName = _nameController.value;
    final validEmail = _emailController.value;
    final validTelp = _telpController.value;
    final validGender = _genderController.value;
    final validAlamat = _alamatController.value;
    final validPassword = _passwordController.value;
    _loadingData.sink.add(true);
    register(validName, validEmail, validTelp, validGender, validAlamat, validPassword);
  }

  register(String name, String email, String telp, String gender, String alamat, String password) async {
    registerResponseModel = await repository.register(name, email, telp, gender, alamat,password);
    String message = registerResponseModel.message;
    print(registerResponseModel.message);
    //_theMessage.sink.add(message);
    Fluttertoast.showToast(msg: registerResponseModel.message);
    _loadingData.sink.add(false);
  }

  void dispose() {
    _theMessage.close();
    _nameController.close();
    _emailController.close();
    _telpController.close();
    _genderController.close();
    _alamatController.close();
    _passwordController.close();
    _loadingData.close();
  }
}
