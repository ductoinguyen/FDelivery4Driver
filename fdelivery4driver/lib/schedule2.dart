import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'map.dart';

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
    @required this.customer_addresss,
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
        assert(customer_addresss != null),
        assert(longitude != null),
        assert(latitude != null);

   String id;
   String order_name;
   double weight;
   double price;
   int days_in_warehouse;
   String status;
   bool is_paid;
   String customer_name;
   String customer_phone;
   int priority;
   String customer_addresss;
   double longitude;
   double latitude;
}
const NoneColor = Color(0xFFEFECF3);
const NhanDonColor = Color(0xFFCD8C7D);
const LuuKhoColor = Color(0xFF89ABD5);

List<Order> orders =  [
  Order(
      id : '1',
      order_name: 'Giày nike',
      weight: 0.4,
      price: 890,
      days_in_warehouse: 5,
      status: 'in_warehosue',
      is_paid: true,
      customer_name: 'Nguyễn Vă A',
      customer_phone: '0932382322',
      priority: 2,
      customer_addresss: '144 Xuân Thủy, 144 Xuân Thủy, 144 Xuân Thủy,144 Xuân Thủy',
      longitude: 105.78475,
      latitude: 21.055945
  ),
  Order(
      id : '1',
      order_name: 'Giày nike Giày nike Giày nike Giày nike Giày nike',
      weight: 0.4,
      price: 890,
      days_in_warehouse: 5,
      status: 'in_warehosue',
      is_paid: true,
      customer_name: 'Nguyễn Vă A',
      customer_phone: '0932382322',
      priority: 2,
      customer_addresss: '144 Xuân Thủy',
      longitude: 105.78475,
      latitude: 21.055945
  ),
  Order(
      id : '1',
      order_name: 'Giày nike',
      weight: 0.4,
      price: 890,
      days_in_warehouse: 5,
      status: 'in_warehosue',
      is_paid: false,
      customer_name: 'Nguyễn Vă A',
      customer_phone: '0932382322',
      priority: 1,
      customer_addresss: '144 Xuân Thủy',
      longitude: 105.78475,
      latitude: 21.055945
  ),
];


class Schedule extends StatefulWidget {
  const Schedule();

  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<Schedule> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

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
  static const height = 250.0;

  String convertPhoneNumber(String a){
    String formattedPhoneNumber =  a.substring(0, 3)
        + ' ' + a.substring(3, 6)
        + ' ' + a.substring(6);
    return formattedPhoneNumber;
  }

  String convertPrice(double a){
    return "";
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Các đơn hàng"),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'cards_demo_list_view',
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            // for (final order in orders(context))
            for (var i =0;  i<orders.length; i++)
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height,
                            child: Card(
                              color: orders[i].status == 'ship_success' ? NhanDonColor : orders[i].status == 'storage' ? LuuKhoColor : NoneColor ,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  ListTile(
                                    leading: orders[i].is_paid ?
                                        Image.asset(
                                          "assets/paid-bg.png",
                                          width: 50,
                                        ) : Icon(Icons.arrow_right_sharp),
                                    title: Text(orders[i].order_name),
                                    subtitle: Text(orders[i].customer_addresss),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("    "),
                                            Icon(Icons.add_ic_call_outlined),
                                            Text("  "+ this.convertPhoneNumber(orders[i].customer_phone)),
                                          ]
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("    "),
                                            Icon(Icons.attach_money ),
                                            Text("  "+ (orders[i].price * 1000).toString() + " VNĐ") ,
                                          ]
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("    "),
                                            Image.asset(
                                              "assets/ship.png",
                                              width: 30,
                                            ),
                                            orders[i].priority == 1 ?
                                            Text("Nhanh") :Text("Tiêu chuẩn")
                                          ]
                                      )
                                    ]
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            if(orders[i].status == 'ship_success' || orders[i].status == 'storage' ) {}
                                            else {
                                              setState(() {
                                                orders[i].status =
                                                'ship_success';
                                              });
                                            }
                                          },
                                          child:
                                          Text(
                                            "Nhận đơn",
                                            style: TextStyle(fontSize: 12),
                                          )
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            if(orders[i].status == 'ship_success' || orders[i].status == 'storage' ) {}
                                            else {
                                              setState(() {
                                                orders[i].status =
                                                'storage';
                                              });
                                            }
                                          },
                                          child:
                                          Text(
                                            "Lưu kho",
                                            style: TextStyle(fontSize: 12),
                                          )
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MapScreen(
                                                    longitude: orders[i].longitude,
                                                    latitude: orders[i].latitude
                                                ),
                                                // Pass the arguments as part of the RouteSettings. The
                                                // DetailScreen reads the arguments from these settings.
                                                // settings: RouteSettings(
                                                //   arguments: {
                                                //     'longitude': orders[i].longitude,
                                                //     'latitude': orders[i].latitude
                                                //   },
                                                // ),
                                              ),
                                            );
                                          },
                                          child:
                                          Text(
                                            "Bản đồ",
                                            style: TextStyle(fontSize: 12),
                                          )
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                title: Text('Chi tiết đơn hàng'),
                                                content: SafeArea(
                                                    top: false,
                                                    bottom: false,
                                                    child:
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          // This array contains the three line description on each card
                                                          // demo.
                                                          // Padding(
                                                          //   padding: const EdgeInsets.only(bottom: 8),
                                                          // ),
                                                          Text(
                                                            orders[i].order_name,
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          Text(
                                                            'Cân nặng: ' + orders[i].weight.toString(),
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          Text(
                                                            'Thời gian lưu kho: ' + orders[i].days_in_warehouse.toString(),
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          Text(
                                                            'Khách hàng: ' + orders[i].customer_name,
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          Text(
                                                            'Số điện thoại: ' +orders[i].customer_phone,
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          Text(
                                                            'Điểm đến: ' + orders[i].customer_addresss,
                                                            style: descriptionStyle.copyWith(color: Colors.black54),
                                                          ),
                                                          if(orders[i].priority == 1)
                                                            Text(
                                                              'Giao hàng tiêu chuẩn',
                                                              style: descriptionStyle.copyWith(color: Colors.black54),
                                                            )
                                                          else
                                                            Text(
                                                              'Giao hàng tiêu nhanh',
                                                              style: descriptionStyle.copyWith(color: Colors.black54),
                                                            )
                                                        ],
                                                      ),
                                                    )
                                                ),
                                                actions: [
                                                  FlatButton(
                                                    textColor: Color(0xFF6200EE),
                                                    onPressed: () => Navigator.pop(context),
                                                    child: Text('OK'),
                                                  )
                                                ],
                                              ),
                                              barrierDismissible: true,
                                            );
                                          },
                                          child:
                                          Text(
                                            "Chi tiết",
                                            style: TextStyle(fontSize: 12),
                                          )
                                      ),
                                      const SizedBox(width: 1),
                                    ],
                                  ),
                                ],
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
          ],
        ),
      ),
    );
  }
}


