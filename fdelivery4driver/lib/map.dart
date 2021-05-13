import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  MapScreen({this.longitude, this.latitude});
  final double longitude;
  final double latitude;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kinh độ + vĩ độ'),
      ),
      body: ListTile(
        title: Text('${widget.longitude}'),
        subtitle: Text('${widget.latitude}'),
      ),
    );
  }
}