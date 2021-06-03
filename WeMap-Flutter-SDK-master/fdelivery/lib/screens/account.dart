import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';

import '../authenticate.dart';
import '../entity/driver.dart';

class Account extends StatefulWidget {
  const Account({Key key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isLoading = false;

  static const height = 50.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scrollbar(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView(
            restorationId: 'cards_demo_list_view',
            padding: const EdgeInsets.only(top: 8),
            children: [
              ListTile(
                title: Text("Xin chào, " + driver.name),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/info');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.white,
                      onSurface: Colors.lightBlueAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/logo-bg.png",
                          width: size.width * 0.25,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text("Thông tin tài khoản")
                        ),
                      ],
                    )
                  ),
                ]
              ),
              SizedBox(height: 15),
              Item(
                leading: Icon(MaterialCommunityIcons.ticket),
                title: Text('Ví voucher'),
              ),
              Item(
                leading: Icon(MaterialCommunityIcons.credit_card_multiple_outline),
                title: Text('Thanh toán'),
              ),
              Item(
                leading: Icon(Icons.help_center_outlined),
                title: Text('Trung tâm hỗ trợ'),
              ),
              Item(
                leading: Icon(MaterialCommunityIcons.account_switch),
                title: Text('Ứng dụng của khách hàng'),
              ),
              Item(
                leading: Icon(Icons.announcement_outlined),
                title: Text('Chính sách quy định'),
              ),
              Item(
                leading: Icon(Icons.settings_outlined),
                title: Text('Cài đặt'),
              ),
              Item(
                leading: Icon(MaterialCommunityIcons.information_outline),
                title: Text('Thông tin ứng dụng'),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: size.width * 0.28,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    // padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                    // border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                    color: Colors.deepOrangeAccent,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final res = await Authenticate().logout();
                      final data = jsonDecode(res);
                      if (data['message'] == 'success') {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.popAndPushNamed(context, '/login');
                        print('Logout ' + data['message']);
                      } else {
                        print('Logout fail');
                      }
                    },
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isLoading) CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Widget leading;
  final Widget title;

  const Item({Key key, @required this.leading, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
      onTap: () {},
      tileColor: Colors.white,
      horizontalTitleGap: 0,
    );
  }
}