import 'package:flutter/material.dart';
import 'package:kandangapp/src/blocs/auth_bloc.dart';
import 'package:kandangapp/src/ui/homepage/home_page.dart';
import 'package:kandangapp/src/ui/login/login.dart';
import 'package:kandangapp/src/utils/route_generator.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    authBloc.restoreSession();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kandang App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: createContent(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  createContent() {
    return StreamBuilder<bool>(
        stream: authBloc.isSessionValid,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return MyHomePage();
          } else {
            return LoginScreen();
          }
        });
  }
}
