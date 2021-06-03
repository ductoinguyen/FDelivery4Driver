import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wemapgl/wemapgl.dart';
import 'package:http/http.dart' as http;

import '../wemap/ePage.dart';

class RoutePage extends ePage {
  RoutePage({Key key})
      : super(const Icon(Icons.directions), 'Direction');

  @override
  Widget build(BuildContext context) {
    return Routing();
  }
}

class Routing extends StatefulWidget {
  // const Routing();

  @override
  State createState() => RoutingState();
}

class RoutingState extends State<Routing> {

  Future<dynamic> getNameByCoordinate(double latitude, double longitude) async {
    double lat = latitude, lon = longitude;
    var res = await http.get('https://apis.wemap.asia/geocode-1/reverse?point.lat='+lat.toString()+'&point.lon='+lon.toString()+'&key=GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ&size=1');
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('Cannot get location name');
    }
  }

  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    _panelOpened = size.height - MediaQuery.of(context).padding.top;

    // LatLng location = latLngArr[latLngIndex];
    // if(latLngIndex >= 0) print('Destination: ' + latLngArr[latLngIndex].toString());
    // return
    return (latLngIndex >= 0 && destination != null) ?
    WeMapDirection(
      originIcon: "assets/symbols/origin.png",
      destinationIcon: "assets/symbols/destination.png",
      originPlace: new WeMapPlace(
        location: currentLocation,
        // location: new LatLng(21.0313, 105.85160000000002)
      ),
      destinationPlace: new WeMapPlace(
        location: destination,
        // location: new LatLng(21.036098, 105.790704)
      ),
    ) :
    WeMapDirection(
      originIcon: "assets/symbols/origin.png",
      destinationIcon: "assets/symbols/destination.png",
    );
  }
}
