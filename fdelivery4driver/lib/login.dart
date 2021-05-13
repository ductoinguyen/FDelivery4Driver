import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return SingleChildScrollView(
        child: Stack(
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child:
                        Ink.image(
                          image: AssetImage(
                            'assets/logo(new).png',
                          ),
                          fit: BoxFit.cover,
                          child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25,
                            offset: Offset(0, -8)
                        )
                      ]
                  ),
                  margin: EdgeInsets.only(top: 110),
                  padding: EdgeInsets.all(15),
                  child:
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.orangeAccent
                            ),
                          )
                      ),
                     Padding(
                       padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                       child: TextField(
                         style: TextStyle(fontSize: 18, color: Colors.black),
                         decoration: InputDecoration(
                           labelText: "Số điện thoại",
                           labelStyle:
                             TextStyle(color: Color(0xff888888), fontSize: 15),
                         ),
                       )
                     ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: <Widget>[
                              TextField(
                                style: TextStyle(fontSize: 18, color: Colors.black),
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Mật khẩu",
                                  labelStyle:
                                  TextStyle(color: Color(0xff888888), fontSize: 15),
                                ),
                              ),
                              Text(
                                'Hiện',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.amberAccent
                                ),
                              )
                            ],
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: RaisedButton(
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                onPressed: () {
                                  showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                  title: Text('Tính năng không hỗ trợ'),
                                  content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                                  ),
                                  barrierDismissible: true,
                                  );
                                },
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                  )
                                ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Column(
                          children: <Widget>[
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Tính năng không hỗ trợ'),
                                      content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                                    ),
                                    barrierDismissible: true,
                                  );
                                },
                                child:
                                Text(
                                  "Bạn chưa có tài khoản",
                                  style: TextStyle(fontSize: 12),
                                )
                            ),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Tính năng không hỗ trợ'),
                                      content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                                    ),
                                    barrierDismissible: true,
                                  );
                                },
                                child:
                                Text(
                                  "Quên mật khẩu",
                                  style: TextStyle(fontSize: 12),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ]
        )
    );
  }
}
//
// class TextFieldContainer extends StatefulWidget{
//   const TextFieldContainer({
//     Key key,}) : super(key:key);
//   @override
//   Widget build(BuildContext context){
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         color: kPrimary
//       ),
//     )
//
//     }
//   }
// }
