import 'package:flutter/material.dart';
import 'package:kandangapp/ui/homepage/home_page.dart';
import 'package:kandangapp/ui/login/login.dart';

class RouteGenerator {
  
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    final MyHomePage _myHomePage = MyHomePage();
    final LoginScreen _login = LoginScreen();

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => _myHomePage);
        break;
      case '/':
        return MaterialPageRoute(builder: (_) => _login);
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
