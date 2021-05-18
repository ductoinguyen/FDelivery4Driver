import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  Account({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scrollbar(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            ListView(
              restorationId: 'cards_demo_list_view',
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              children: [
                ListTile(
                  title: Text("Xin chào Nguyễn VĂn A"),
                  trailing: PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => <PopupMenuItem<String>>[
                      PopupMenuItem<String>(
                        value: 'abc',
                        child: Text(
                          'Chỉnh sửa thông tin',
                        ),
                      ),
                      PopupMenuItem<String>(
                        child: Text(
                          'Đổi mật khẩu',
                        ),
                      ),
                      PopupMenuItem<String>(
                        value:
                        'abc',
                        enabled: false,
                        child: Text(
                          'Vô hiệu hóa tài khoản',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo-bg.png",
                        width: size.width * 0.25,
                      ),
                      Text("Tôi")
                    ],
                  ),
                ),

                // SizedBox(height: size.height * 0.05),
                SizedBox(height: size.height * 0.03),
                SizedBox(
                  height: 50,
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
                                      Text("  "),
                                      Icon(Icons.widgets_rounded),
                                      Text("  Ví voucher"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.work_rounded),
                                        Text("  Thanh toán"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.zoom_in_rounded),
                                        Text("  Trung tâm hỗ trợ"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.account_balance_wallet_rounded),
                                        Text("  Ứng dụng của khách hàng"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.announcement_rounded),
                                        Text("  Chính sách quy định"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.ac_unit_rounded),
                                        Text("  Cài đặt"),
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
                SizedBox(
                  height: 50,
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
                                        Text("  "),
                                        Icon(Icons.workspaces_filled),
                                        Text("  Thông tin ứng dụng"),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      // padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                      // border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                      color: Color(0xFFC6A7A7),
                      onPressed: () {
                      },
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(
                            color: Colors.orangeAccent[700],
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}


