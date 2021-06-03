import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entity/driver.dart';
import 'order_detail.dart';

class AccountInfo extends StatelessWidget {
  AccountInfo({Key key}) : super(key: key);
  static const height = 50.0;

  String convertPhoneNumber(String a){
    String formattedPhoneNumber =  a.substring(0, 3)
        + ' ' + a.substring(3, 6)
        + ' ' + a.substring(6);
    return formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double leftWidth = 0.33;
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin tài khoản")
      ),
      body: Scrollbar(
        child: Column(
          children: [
            DetailContent('Họ tên', driver.name),
            Line(),
            DetailContent('Số điện thoại', convertPhoneNumber(driver.phoneNumber)),
            Line(),
            DetailContent('Ngày sinh', driver.birthday),
            Line(),
            DetailContent('Địa chỉ', driver.address),
            Line(),
            DetailContent('Biển số xe', driver.licensePlates),
            SizedBox(height: size.height * 0.02),
            // ListTile(
            //   leading: Image.asset(
            //     "assets/logo-bg.png",
            //     // width: size.width * 0.1,
            //   ),
            //   title: Text("Đổi ảnh đại diện"),
            //   trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
            //   // horizontalTitleGap: 0,
            //   onTap: () {},
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white,
                      onPrimary: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Đổi ảnh đại diện"),
                        Icon(Icons.arrow_forward_ios, size: 15.0),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/password');
                    },
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white,
                      onPrimary: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Đổi mật khẩu"),
                        Icon(Icons.arrow_forward_ios, size: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}