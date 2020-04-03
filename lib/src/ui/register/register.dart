import 'package:flutter/material.dart';
import 'package:kandangapp/src/blocs/register_bloc.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/button_widget.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/email_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/loginpage/password_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/registerpage/alamat_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/registerpage/gender_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/registerpage/nama_field_widget.dart';
import 'package:kandangapp/src/resources/widgets/registerpage/telp_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterBloc _bloc = RegisterBloc();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top:30.0, bottom: 20.0),
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
                    namaField(_bloc),
                    emailField(_bloc),
                    telpField(_bloc),
                    genderField(_bloc),
                    passwordField(_bloc),
                    alamatField(_bloc),
                    submitButton(_bloc, "Register"),
                    SizedBox(height: 10,),
                    loadingIndicator(_bloc),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xFFA7A7AA), fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text(
                      "Login",
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

Widget loadingIndicator(T) => StreamBuilder<bool>(
    stream: T.loading,
    builder: (context, snap) {
      return Container(
        child:
            (snap.hasData && snap.data) ? CircularProgressIndicator() : null,
      );
    },
  );
