import 'package:flutter/material.dart';
import 'package:kandangapp/ui/dashboard/dashboard.dart';
import 'package:kandangapp/ui/katalog/katalog.dart';
import 'package:kandangapp/ui/profile/profile.dart';
import 'package:kandangapp/ui/ternak/ternak.dart';
import 'package:kandangapp/widgets/base_app_bar.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    Katalog(),
    Ternak(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        selectedItemColor: Color(0xFFFF0054),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 20.0,
        items: [
          new BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/dashboard.png',
              fit: BoxFit.fill,
              height: 20,
              color: _currentIndex == 0
                ? Color(0xFFFF0054)
                : Colors.black,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text('Home',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/catalog.png',
              fit: BoxFit.fill,
              height: 20,
              color: _currentIndex == 1
                ? Color(0xFFFF0054)
                : Colors.black,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text('Katalog',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Image.asset(
                'assets/images/farm.png',
                fit: BoxFit.fill,
                height: 20,
                color: _currentIndex == 2
                  ? Color(0xFFFF0054)
                  : Colors.black,
              ),
            title: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text('Ternak',
                style: TextStyle(fontSize: 12),
              ),
            )
          ),
          new BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              fit: BoxFit.fill,
              height: 20,
              color: _currentIndex == 3
                ? Color(0xFFFF0054)
                : Colors.black,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text('Profile', 
                style: TextStyle(fontSize: 12),
              ),
            )
          ),
        ],
      ),
      body: _children[_currentIndex]
    );
  }
}