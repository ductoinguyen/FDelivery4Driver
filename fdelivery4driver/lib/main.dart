import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _currentIndex = 0;

  final List<Widget> tabs = <Widget>[
    Home(),
    Center(child: Text("List")),
    Center(child: Text("Map")),
    Center(child: Text("Account"))
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
