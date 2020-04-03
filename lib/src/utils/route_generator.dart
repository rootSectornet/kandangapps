import 'package:flutter/material.dart';
import 'package:kandangapp/app.dart';
import 'package:kandangapp/src/ui/homepage/home_page.dart';
import 'package:kandangapp/src/ui/kandang/all_kandang.dart';
import 'package:kandangapp/src/ui/kandang/kandang.dart';
import 'package:kandangapp/src/ui/katalog/detail_katalog.dart';
import 'package:kandangapp/src/ui/login/login.dart';
import 'package:kandangapp/src/ui/register/register.dart';
import 'package:kandangapp/src/ui/ternak/paket_ternak.dart';

class RouteGenerator {
  
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    final App _app = App();
    final MyHomePage _myHomePage = MyHomePage();
    final LoginScreen _login = LoginScreen();
    final RegisterScreen _register = RegisterScreen();
    final DetailKatalog _detailKatalog = DetailKatalog();
    final Category _category = Category(args: args,);
    final PaketTernak _paketTernak = PaketTernak();
    final AllKandang _allKandang = AllKandang();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => _app);
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => _myHomePage);
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => _login);
        break;
      case '/register':
        return MaterialPageRoute(builder: (_) => _register);
        break;
      case '/category':
        return MaterialPageRoute(builder: (_) => _category);
        break;
      case '/detail':
        return MaterialPageRoute(builder: (_) => _detailKatalog);
        break;
      case '/paketternak':
        return MaterialPageRoute(builder: (_) => _paketTernak);
        break;
      case '/allkandang':
        return MaterialPageRoute(builder: (_) => _allKandang);
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
