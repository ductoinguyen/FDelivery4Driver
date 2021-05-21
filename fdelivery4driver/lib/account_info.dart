import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app.dart';
class AccountInfo {
  AccountInfo({
    @required this.id,
    @required this.phone,
    @required this.name,
    @required this.email,
    @required this.gender,
    @required this.bod,
    @required this.job})
      : assert(id != null),
        assert(phone != null),
        assert(name != null),
        assert(email != null),
        assert(gender != null),
        assert(bod != null),
        assert(job != null);

  String id;
  String phone;
  String name;
  String email;
  bool gender;
  String bod;
  String job;
}

AccountInfo info = AccountInfo(
    id: '111',
    phone: '0987566473',
    name: 'Nguyễn Văn A',
    email: 'nva@gmail.com',
    gender: true,
    bod: '11/11/2000',
    job: 'sinh viên'
);
class Account_Info extends StatelessWidget {
  Account_Info({Key key}) : super(key: key);
  static const height = 50.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    print(size);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Thông tin tài khoản")
      ),
      body: Scrollbar(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView(
                restorationId: 'cards_demo_list_view',
                padding: const EdgeInsets.only(top: 8),
                children: [
                  SizedBox(
                      height: 9.05 * height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3 * height,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.01),
                                  Column(
                                    children: [
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Image.asset(
                                                    "assets/logo-bg.png",
                                                    width: size.width * 0.15,
                                                  ),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text("Đổi ảnh đại diện"),
                                                  Icon(Icons.arrow_forward_ios, size: 15.0),
                                                  Text("  "),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Số điện thoại"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(info.phone+ " "),
                                                ]
                                            ),
                                          ]
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6 * height,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.02),
                                  Column(
                                    children: [
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Tên của bạn"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(info.name+ " "),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Email"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(info.email+ " "),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Giới tính"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  if(info.gender) Text("Nữ  ")
                                                  else Text("Name"),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Ngày sinh"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(info.bod+ " "),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("  Nghề nghiệp"),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(info.job+ " "),
                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Stack(
                                          alignment: AlignmentDirectional.centerEnd,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return App(possition: 3);
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child:
                                                      Text(
                                                        "Đổi mật khẩu",
                                                      )
                                                  ),
                                                ]
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Icon(Icons.arrow_forward_ios, size: 15.0),
                                                  Text("  "),
                                                ]
                                            ),
                                          ]
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],

              ),
            ],
          ),
        ),
      )
    );
  }
}

