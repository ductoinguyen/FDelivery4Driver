import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

import '../entity/order.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({this.order});

  final Order order;

  String convertPhoneNumber(String a){
    String formattedPhoneNumber =  a.substring(0, 3)
        + ' ' + a.substring(3, 6)
        + ' ' + a.substring(6);
    return formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailTitle('Sản phẩm'),
            DetailContent('Tên', order.order_name),
            Line(),
            DetailContent('Cân nặng', order.weight.toString() + ' kg'),
            DetailTitle('Khách hàng'),
            DetailContent('Tên', order.customer_name),
            Line(),
            DetailContent('SĐT', convertPhoneNumber(order.customer_phone)),
            Line(),
            DetailContent('Địa chỉ', order.customer_address),
            DetailTitle('Đơn hàng'),
            DetailContent('Giá', (order.price * 1000).toVND()),
            Line(),
            DetailContent('Số ngày lưu kho', order.days_in_warehouse.toString() + ' ngày'),
            Line(),
            DetailContent(
              'Trạng thái',
              order.status == 'storage' ?
              'Lưu kho' :
              order.status == 'ship_success' ?
              'Đã giao' :
              'Đang vận chuyển'
            ),
            Line(),
            DetailContent('Thanh toán', order.is_paid == true ? 'Đã thanh toán' : 'Chưa thanh toán'),
          ],
        ),
      ),
    );
  }
}

class DetailTitle extends StatelessWidget {
  final String title;

  DetailTitle(this.title);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // border: Border(
            //   bottom: BorderSide(width: 1, color: Colors.grey)
            // )
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: size.height * 0.021,
              fontWeight: FontWeight.bold,
              color: Colors.black87
            )
          ),
        )
      ],
    );
  }
}

class DetailContent extends StatelessWidget {
  final String title;
  final String content;

  DetailContent(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double leftWidth = 0.41;
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(width: 1, color: Colors.grey),
      //   )
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width * leftWidth,
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: size.height * 0.025, color: Colors.black87, height: 1.8, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: title + ':'),
                        // TextSpan(text: driver.name)
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width * (1 - leftWidth),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: size.height * 0.025, color: Colors.black87, height: 1.8),
                      children: <TextSpan>[
                        TextSpan(text: content),
                        // TextSpan(text: driver.name)
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey[350])
        )
      ),
    );
  }
}