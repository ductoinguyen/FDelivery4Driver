import 'package:flutter/material.dart';
import 'home.dart';
import 'schedule2.dart';
import 'login2.dart';
import 'account.dart';
import 'account_info.dart';
import 'account_password.dart';


class App extends StatefulWidget {
  App({this.possition});
  final int possition;
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _currentIndex = 0;
  int count = 0;

  final List<Widget> tabs_1 = <Widget>[
    Home(),
    Schedule(),
    Login(),
    Account(),
  ];
  final List<Widget> tabs_2 = <Widget>[
    Home(),
    Schedule(),
    Login(),
    Account_Info(),
  ];
  final List<Widget> tabs_3 = <Widget>[
    Home(),
    Schedule(),
    Login(),
    AccountPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    if(widget.possition != 1) {
      if(count == 0) {
        setState(() {
          _currentIndex = 3;
        });
      }
    }

    return Scaffold(
      body: SafeArea(
          child: widget.possition == 1 ? tabs_1[_currentIndex]
                                        : widget.possition == 2 ? tabs_2[_currentIndex]
                                        : tabs_3[_currentIndex]
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
            print(_currentIndex);
          });
        },
      ),
    );
  }
}
