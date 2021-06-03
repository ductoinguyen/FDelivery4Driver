import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wemapgl/wemapgl.dart';

import '../main.dart';
import '../entity/driver.dart';
import '../entity/order.dart';
import '../authenticate.dart';
import 'order_detail.dart';

const NoneColor = Color(0xFFE1E1E1);
// const ShipColor = Color(0xFFCD8C7D);
const ShipColor = Color(0xFF9CCC65);
// const StorageColor = Color(0xFF89ABD5);
const StorageColor = Colors.lightBlueAccent;


class Schedule extends StatefulWidget {
  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<Schedule> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);
  bool isLoading = false;

  @override
  String get restorationId => 'cards_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  String convertPhoneNumber(String a){
    String formattedPhoneNumber =  a.substring(0, 3)
        + ' ' + a.substring(3, 6)
        + ' ' + a.substring(6);
    return formattedPhoneNumber;
  }

  Future<dynamic> changeStatusOrder(String orderId, String status) async {
    var res = await http.put(
      '$url/order/$orderId/$status',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'orderId': orderId,
        'status': status,
      }),
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('Thay đổi trạng thái đơn hàng không thành công!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final theme = Theme.of(context);
    // final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    // final descriptionStyle = theme.textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Các đơn hàng"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          (!hasBooked) ?
          Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bạn không có đơn hàng'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MaterialCommunityIcons.hand_pointing_left),
                  Text(' Vui lòng bấm Nhận đơn'),
                ],
              )
            ],
          )
          ) :
          ListView.builder(
            itemCount: orders.length,
            restorationId: 'cards_demo_list_view',
            // padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            itemBuilder: (BuildContext context, int i) {
              latLngArr.add(new LatLng(orders[i].latitude, orders[i].longitude));
              return Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(bottom: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    decoration: BoxDecoration(
                      color: orders[i].status == 'ship_success'
                          ? ShipColor
                          : orders[i].status == 'storage'
                          ? StorageColor
                          : NoneColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.2,
                                child: orders[i].is_paid ?
                                  Image.asset(
                                    "assets/paid-bg.png",
                                    width: 50,
                                    height: 50,
                                  ) :
                                  Image.asset(
                                    "assets/cod.png",
                                    width: 50,
                                    height: 50,
                                  ),
                              ),
                              Container(
                                width: (size.width - 30) * 0.8,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            text: TextSpan(
                                              style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(text: orders[i].order_name)
                                              ]
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            text: TextSpan(
                                              style: TextStyle(color: Colors.black87, height: 1.5),
                                              children: <TextSpan>[
                                                TextSpan(text: orders[i].customer_address)
                                              ]
                                            )
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.2,
                                child: Center(
                                  child: Icon(Icons.add_ic_call_outlined),
                                ),
                              ),
                              Container(
                                width: (size.width - 30) * 0.8,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black87),
                                          children: <TextSpan>[
                                            TextSpan(text: convertPhoneNumber(orders[i].customer_phone))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.2,
                                child: Center(
                                  child: Icon(MaterialCommunityIcons.cash),
                                ),
                              ),
                              Container(
                                width: (size.width - 30) * 0.8,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black87),
                                          children: <TextSpan>[
                                            TextSpan(text: (orders[i].price * 1000).toVND())
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 7),
                          child: Row(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.2,
                                child: Center(
                                  child: Icon(MaterialCommunityIcons.truck_fast),
                                ),
                              ),
                              Container(
                                width: (size.width - 30) * 0.8,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black87),
                                          children: <TextSpan>[
                                            TextSpan(text: orders[i].priority == 1
                                              ? "Nhanh"
                                              : "Tiêu chuẩn")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  color:
                                    orders[i].status == 'ship_success' ?
                                    Colors.lightGreen :
                                    orders[i].status == 'storage' ?
                                    Colors.lightBlue : ShipColor,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateColor.resolveWith((states) => (
                                        orders[i].status == 'ship_success'
                                        || orders[i].status == 'storage')
                                        ? Colors.black38 : Colors.white),
                                      backgroundColor: MaterialStateColor.resolveWith((states) =>
                                        orders[i].status == 'ship_success' ?
                                        Colors.lightGreen :
                                        orders[i].status == 'storage'
                                        ? Colors.lightBlue : ShipColor),
                                      // shadowColor: MaterialStateColor.resolveWith((states) => ShipColor),
                                      elevation: MaterialStateProperty.resolveWith((states) => 0),
                                    ),
                                    onPressed: (orders[i].status == 'ship_success' || orders[i].status == 'storage') ? null : () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var res = await changeStatusOrder(orders[i].id, 'ship_success');
                                      var data = jsonDecode(res);
                                      if (data['message'] == 'Thành công') {
                                        setState(() {
                                          orders[i].status = 'ship_success';
                                          orders[i].is_paid = true;
                                          isLoading = false;
                                        });
                                        orders[i].status = 'ship_success';
                                        orders[i].is_paid = true;
                                        print('Change order status to ship success');
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text('Thay đổi trạng thái đơn hàng không thành công!'),
                                          ),
                                          barrierDismissible: true,
                                        );
                                        print('Fail to change order status');
                                      }
                                    },
                                    child: Icon(MaterialCommunityIcons.truck_check)
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  color:
                                    orders[i].status == 'ship_success' ?
                                    Colors.lightGreen :
                                    orders[i].status == 'storage' ?
                                    Colors.lightBlue : Colors.lightBlue,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateColor.resolveWith((states) => (
                                          orders[i].status == 'ship_success'
                                              || orders[i].status == 'storage')
                                          ? Colors.black38 : Colors.white),
                                      backgroundColor: MaterialStateColor.resolveWith((states) =>
                                        orders[i].status == 'ship_success' ?
                                        Colors.lightGreen :
                                        orders[i].status == 'storage'
                                        ? Colors.lightBlue : Colors.lightBlue),
                                      // shadowColor: MaterialStateColor.resolveWith((states) => StorageColor),
                                      elevation: MaterialStateProperty.resolveWith((states) => 0),
                                    ),
                                    onPressed: (orders[i].status == 'ship_success' || orders[i].status == 'storage') ? null : () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var res = await changeStatusOrder(orders[i].id, 'storage');
                                      var data = jsonDecode(res);
                                      if (data['message'] == 'Thành công') {
                                        setState(() {
                                          orders[i].status = 'storage';
                                          isLoading = false;
                                        });
                                        orders[i].status = 'storage';
                                        print('Change order status to storage');
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text('Thay đổi trạng thái đơn hàng không thành công!'),
                                          ),
                                          barrierDismissible: true,
                                        );
                                        print('Fail to change order status');
                                      }
                                    },
                                    child:
                                    Icon(MaterialCommunityIcons.database_import)
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  color: Colors.white,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateColor.resolveWith((states) => (Colors.blue)),
                                      backgroundColor: MaterialStateColor.resolveWith((states) => (Colors.white)),
                                      elevation: MaterialStateProperty.resolveWith((states) => 0),
                                    ),
                                    onPressed: () {
                                      latLngIndex = i;
                                      destination = latLngArr[latLngIndex];
                                      print(latLngIndex);
                                      print('From ' + currentLocation.toString() + ' to ' + destination.toString());
                                      tabIndex = 2;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => App()),
                                      );
                                    },
                                    child:
                                    Icon(Icons.map)
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  color: Colors.white,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateColor.resolveWith((states) => (Colors.blue)),
                                      backgroundColor: MaterialStateColor.resolveWith((states) => (Colors.white)),
                                      elevation: MaterialStateProperty.resolveWith((states) => 0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return OrderDetail(order: orders[i]);
                                          },
                                        ),
                                      );
                                    },
                                    child:
                                    Icon(MaterialCommunityIcons.clipboard_text_outline)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              );
            }
          ),
          if (isLoading) CircularProgressIndicator(),
        ],
      )
    );
  }
}


