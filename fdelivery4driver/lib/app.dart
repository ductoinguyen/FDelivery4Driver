import 'package:flutter/material.dart';
import 'home.dart';
import 'schedule2.dart';
import 'login2.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _currentIndex = 0;

  final List<Widget> tabs = <Widget>[
    Home(),
    Schedule(),
    Login(),
    Text('sđs')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        unselectedFontSize: 10,
        selectedFontSize: 11,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            // ignore: deprecated_member_use
            label: "Lịch trình",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            // ignore: deprecated_member_use
            label: "Bản đồ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            // ignore: deprecated_member_use
            label: "Tài khoản",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
