import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'driver.dart';
import '../main.dart';
import '../authenticate.dart';

String driverId = driver.id;

class Order {
  Order({
    @required this.id,
    @required this.order_name,
    @required this.weight,
    @required this.price,
    @required this.days_in_warehouse,
    @required this.status,
    @required this.is_paid,
    @required this.customer_name,
    @required this.customer_phone,
    @required this.priority,
    @required this.customer_address,
    @required this.longitude,
    @required this.latitude})
      : assert(id != null),
        assert(order_name != null),
        assert(weight != null),
        assert(price != null),
        assert(days_in_warehouse != null),
        assert(status != null),
        assert(is_paid != null),
        assert(customer_name != null),
        assert(customer_phone != null),
        assert(priority != null),
        assert(customer_address != null),
        assert(longitude != null),
        assert(latitude != null);

  String id;
  String order_name;
  double weight;
  int price;
  int days_in_warehouse;
  String status;
  bool is_paid;
  String customer_name;
  String customer_phone;
  int priority;
  String customer_address;
  double longitude;
  double latitude;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    order_name: json['order_name'],
    weight: json['weight'] + .0,
    price: json['price'].toInt(),
    days_in_warehouse: json['days_in_warehouse'],
    status: json['status'],
    is_paid: json['is_paid'],
    customer_name: json['customer_name'],
    customer_phone: json['customer_phone'],
    priority: json['priority'],
    customer_address: json['customer_address'],
    longitude: json['longitude'],
    latitude: json['latitude'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_name": order_name,
    "weight": weight,
    "price": price,
    "days_in_warehouse": days_in_warehouse,
    "status": status,
    "is_paid": is_paid,
    "customer_name": customer_name,
    "customer_phone": customer_phone,
    "priority": priority,
    "customer_address": customer_address,
    "longitude": longitude,
    "latitude": latitude,
  };
}

void listOrders(String day) async {
  var res = await http.get('$url/order/list/$day/$driverId');
  if (res.statusCode == 200) {
    var jsonData = jsonDecode(res.body);
    print('Today has ' + jsonData.length.toString() + ' orders');
    if (jsonData.length > 0) {
      for (var o in jsonData) {
        orders.add(Order.fromJson(o));
      }
      hasBooked = true;
    } else {
      hasBooked = false;
    }
  } else {
    throw Exception('Fail to get data');
  }
}

Future<dynamic> detailOrder(String orderId) async {
  var res = await http.get('$url/order/$orderId');
  if (res.statusCode == 200) {
    return res.body;
  } else {
    throw Exception('Fail to get data');
  }
}