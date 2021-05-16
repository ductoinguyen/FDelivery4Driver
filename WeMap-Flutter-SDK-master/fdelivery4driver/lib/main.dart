import 'package:fdelivery4driver/route.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:wemapgl/wemapgl.dart' as WEMAP;

void main() {
  WEMAP.Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');
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
      // debugShowCheckedModeBanner: false,
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
    Home(
      key: PageStorageKey('Home'),
    ),
    Center(child: Text("List")),
    RoutePage(
      key: PageStorageKey('Full map'),
    ),
    Center(child: Text("Account"))
  ];

  PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          child: tabs[_currentIndex],
          bucket: bucket,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          unselectedFontSize: 10,
          selectedFontSize: 10,
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
      )
    );
  }
}
