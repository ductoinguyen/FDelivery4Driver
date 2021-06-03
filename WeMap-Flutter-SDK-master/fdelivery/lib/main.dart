import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:f4deliverydriver/wemap/full_map.dart';
import 'package:intl/intl.dart';
import 'package:ip_geolocation_api/ip_geolocation_api.dart';

// import 'wemap/animate_camera.dart';
// import 'wemap/full_map.dart';
// import 'wemap/line.dart';
// import 'wemap/map_ui.dart';
// import 'wemap/move_camera.dart';
// import 'wemap/ePage.dart';
// import 'wemap/place_circle.dart';
// import 'wemap/place_symbol.dart';
// import 'wemap/place_fill.dart';
// import 'wemap/place_geojson.dart';
// import 'wemap/scrolling_map.dart';
import 'screens/route.dart';
// import 'wemap/search.dart';
// import 'wemap/simpleDirection.dart';
import 'package:wemapgl/wemapgl.dart' as WEMAP;

import 'dart:async';
import 'screens/login2.dart';
import 'screens/home.dart';
import 'screens/schedule2.dart';
import 'screens/account.dart';
import 'screens/account_info.dart';
import 'screens/account_password.dart';
import 'entity/order.dart';

// final List<ePage> _allPages = <ePage>[
//   MapUiPage(),
//   SearchPage(),
//   SimpleDirectionPage(),
//   FullMapPage(),
//   RoutePage(),
//   AnimateCameraPage(),
//   MoveCameraPage(),
//   PlaceSymbolPage(),
//   LinePage(),
//   PlaceCirclePage(),
//   PlaceFillPage(),
//   PlaceGeoJSONPage(),
//   ScrollingMapPage(),
// ];

// class MapsDemo extends StatelessWidget {
//   void _pushPage(BuildContext context, ePage page) async {
//     final location = Location();
//     final hasPermissions = await location.hasPermission();
//     if (hasPermissions != PermissionStatus.GRANTED) {
//       await location.requestPermission();
//     }
//
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (_) => Scaffold(
//               body: page,
//             )));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('WeMap examples')),
//       body: ListView.builder(
//         itemCount: _allPages.length,
//         itemBuilder: (_, int index) => ListTile(
//           leading: _allPages[index].leading,
//           title: Text(_allPages[index].title),
//           onTap: () => _pushPage(context, _allPages[index]),
//         ),
//       ),
//     );
//   }
// }

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
      // onGenerateRoute: onGenerateRoute,
      home: Login(),
      routes: {
        '/home': (_) => App(),
        '/login': (_) => Login(),
        '/info': (_) => AccountInfo(key: PageStorageKey('AccountInfo')),
        '/password': (_) => AccountPassword(key: PageStorageKey('AccountPassword')),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Order> orders = [];
List<WEMAP.LatLng> latLngArr = [];
int latLngIndex = -1;
WEMAP.LatLng currentLocation = WEMAP.LatLng(21.000355343466683, 105.79840845261796);
WEMAP.LatLng destination;
int tabIndex;

class App extends StatefulWidget {
  // const App({Key key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  GeolocationData geolocationData;

  int _currentIndex = 0;

  final List<Widget> tabs = <Widget>[
    Home(
      // key: PageStorageKey('Home'),
    ),
    Schedule(),
    Routing(),
    Account(
      key: PageStorageKey('Account'),
    )
  ];

  PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    this.getIp();
    latLngArr = [];
    listOrders(new DateFormat('yyyy-MM-dd').format(new DateTime.now()));
    // listOrders("2021-06-01");
  }

  Future<void> getIp() async {
    geolocationData = await GeolocationAPI.getData();
    if (geolocationData != null) {
      currentLocation = new WEMAP.LatLng(geolocationData.lat, geolocationData.lon);
      print('My location: ' + currentLocation.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tabIndex == 2) _currentIndex = tabIndex;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: PageStorage(
            child: tabs[_currentIndex],
            bucket: bucket,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrangeAccent,
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
              tabIndex = 1;
              _currentIndex = index;
              destination = null;
            });
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Thoát ứng dụng'),
        content: new Text('Bạn có chắc muốn thoát không?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Có'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Không'),
          ),
        ],
      ),
    )) ?? false;
  }
}