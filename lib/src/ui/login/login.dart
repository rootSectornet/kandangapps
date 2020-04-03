import 'package:flutter/material.dart';
import 'package:kandangapp/src/blocs/login_bloc.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/button_widget.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/email_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/password_field_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> /*implements LoginView*/ {
  LoginBloc _bloc = LoginBloc();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

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
                  Text(
                    "Kandang",
                    style: TextStyle(color: Color(0xFF282B60), fontSize: 44.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Apps",
                    style: TextStyle(color: Color(0xFFFF0054), fontSize: 44.0),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Login to your account",
                    style: TextStyle(color: Color(0xFFA7A7AA), fontSize: 18.0),
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
                    emailField(_bloc),
                    passwordField(_bloc),
                    submitButton(_bloc, "Login"),
                    SizedBox(height: 10,),
                    loadingIndicator(_bloc),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot your password?",
                    style: TextStyle(color: Color(0xFF1B124F), fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xFFA7A7AA), fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){
                       Navigator.of(context).pushReplacementNamed('/register');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xFFFF0054), fontSize: 18.0),
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

Widget loadingIndicator(LoginBloc bloc) => StreamBuilder<bool>(
    stream: bloc.loading,
    builder: (context, snap) {
      return Container(
        child:
            (snap.hasData && snap.data) ? CircularProgressIndicator() : null,
      );
    },
  );
