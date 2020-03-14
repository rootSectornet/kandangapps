import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kandangapp/main.dart';
import 'package:kandangapp/models/user_model.dart';
import 'package:kandangapp/presenter/login_presenter.dart';
import 'package:kandangapp/view/login_view.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> /*implements LoginView*/ {
  // LoginPresenter _loginPresenter;
  // UserModel _userModel;
  bool _isLoading = false;

  final _formkey = GlobalKey<FormState>();

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return null;
  // }

  // @override
  // void onError(String error) {
  //   // TODO: implement onError
  // }

  // @override
  // void onSuccess(String success) {
  //   // TODO: implement onSuccess
  // }

  // @override
  // void refreshData(UserModel userModel) {
  //   // TODO: implement refreshData
  // }

  //_LoginScreenState(){this._loginPresenter = new LoginPresenter();

  // AppPath.CheckUser().then((check){
  //   if(check){
  //     Navigator.pushReplacementNamed(context, "/");
  //   }
  // });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Kandang",
                    style: TextStyle(
                      color: Color(0xFF282B60),
                      fontSize: 44.0
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Text("Apps",
                    style: TextStyle(
                      color: Color(0xFFFF0054),
                      fontSize: 44.0
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Login to your account",
                    style: TextStyle(
                      color: Color(0xFFA7A7AA),
                      fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 55.0,
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xFFECEDF1),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.black12, blurRadius: 5.0)
                        // ]
                      ),
                      child: Center(
                        child: TextFormField(
                          // onSaved: (val) => _userEmail = val,
                          validator: (val) {
                            return val.length < 3
                                ? "Email must have atleast 3 chars"
                                : null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // icon: Icon(Icons.email),
                              hintText: 'Email'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 55.0,
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xFFECEDF1),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.black12, blurRadius: 5.0)
                        // ]
                      ),
                      child: Center(
                        child: TextFormField(
                          obscureText: true,
                          //onSaved: (val) => _password = val,
                          validator: (val) {
                            return val.length < 3
                                ? "password must have atleast 3 chars"
                                : null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // icon: Icon(Icons.vpn_key),
                              hintText: 'Password'),
                        ),
                      ),
                    ),
                    _isLoading
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50.0, left: 16.0, right: 16.0),
                              child: LinearProgressIndicator(),
                            ),
                          )
                        : InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 50.0),
                              padding: const EdgeInsets.only(
                                  top: 4.0, left: 16.0, right: 16.0, bottom: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  color: Color(0xFFFF0054),
                              ),
                              child: Center(
                                child: Text(
                                  'Login'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/home');
                              // if(_submit()){
                              //   userProvider.doLogin(_userEmail, _password);
                              // }
                            },
                          ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Forgot your password?",
                    style: TextStyle(
                      color: Color(0xFF1B124F),
                      fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFFA7A7AA),
                      fontSize: 18.0
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Sign up",
                    style: TextStyle(
                      color: Color(0xFFFF0054),
                      fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
