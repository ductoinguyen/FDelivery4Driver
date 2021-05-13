import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Order {
  const Order({
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

  final String id;
  final String order_name;
  final double weight;
  final double price;
  final int days_in_warehouse;
  final String status;
  final bool is_paid;
  final String customer_name;
  final String customer_phone;
  final int priority;
  final String customer_addresss;
  final double longitude;
  final double latitude;
}

const color = Color(0xFF6F35A5);

List<Order> orders(BuildContext context) => [
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
      is_paid: true,
      customer_name: 'Nguyễn Vă A',
      customer_phone: '0932382322',
      priority: 1,
      customer_addresss: '144 Xuân Thủy',
      longitude: 105.78475,
      latitude: 21.055945
  ),
];

class OrderItem extends StatelessWidget {
  const OrderItem({Key key, @required this.order})
      : assert(order != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 250.0;
  final Order order;
  // final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                color: Colors.transparent,
                // This ensures that the Card's children are clipped correctly.
                // clipBehavior: Clip.antiAlias,
                // shape: shape,

                child: OrderContent(order: order),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child:
        Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
// ["in_warehouse", "transferring", => trắng
// "storage", luư kho =>
// "ship_success"]

class OrderContent extends StatelessWidget {
  const OrderContent({Key key, @required this.order})
      : assert(order != null),
        super(key: key);

  final Order order;
  String convertPhoneNumber(String a){
    String formattedPhoneNumber =  a.substring(0, 3)
        + ' ' + a.substring(3, 6)
        + ' ' + a.substring(6);
    return formattedPhoneNumber;
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                ListTile(
                  leading: order.is_paid ?
                  Image.asset(
                    "assets/logo-bg.png",
                    width: 30,
                  ) : Icon(Icons.arrow_right_sharp),
                  title: Text(order.order_name),
                  subtitle: Text(order.customer_addresss),
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
                            Text("  "+ this.convertPhoneNumber(order.customer_phone)),
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("    "),
                            Icon(Icons.attach_money ),
                            Text("  "+ (order.price * 1000).toString() + " VNĐ") ,
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
                            order.priority == 1 ?
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
                          // setState(() {
                          //   status = 'in_warehouse';
                          // });

                        },
                        child:
                        Text(
                          "Nhận đơn",
                          style: TextStyle(fontSize: 12),
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          // setState(() {
                          //   status = 'storage';
                          // });
                        },
                        child:
                        Text(
                          "Lưu kho",
                          style: TextStyle(fontSize: 12),
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          // setState(() {
                          //   status = 'none';
                          // });
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
                                          order.order_name,
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        Text(
                                          'Cân nặng: ' + order.weight.toString(),
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        Text(
                                          'Thời gian lưu kho: ' + order.days_in_warehouse.toString(),
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        Text(
                                          'Khách hàng: ' + order.customer_name,
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        Text(
                                          'Số điện thoại: ' +order.customer_phone,
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        Text(
                                          'Điểm đến: ' + order.customer_addresss,
                                          style: descriptionStyle.copyWith(color: Colors.black54),
                                        ),
                                        if(order.priority == 1)
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
                  ],
                ),
              ],
            ),
          ),
        ),
        // share, explore buttons

      ],
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      body: Scrollbar(
        child: ListView(
          restorationId: 'cards_demo_list_view',
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final order in orders(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: OrderItem(order: order)
              ),
          ],
        ),
      ),
    );
  }
}

