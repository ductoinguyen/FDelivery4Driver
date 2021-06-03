import 'package:flutter/material.dart';
import 'dart:convert';

import '../authenticate.dart';
import '../entity/driver.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  bool _isObscure = true;
  String phoneNumber = '09108028136', password = '123456';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                          "assets/logo-bg.png",
                          width: size.width * 0.5,
                      ),
                      SizedBox(height: size.height * 0.05),
                      SizedBox(height: size.height * 0.03),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EDE7),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextField(
                          controller: new TextEditingController(text: phoneNumber),
                          keyboardType: TextInputType.number,
                          onChanged: (value) { phoneNumber = value; },
                          cursorColor: Color(0xFF0E0E09),
                          decoration: InputDecoration(
                            hintText: "Số điện thoại",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1EDE7),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child:
                        TextField(
                          controller: new TextEditingController(text: password),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) { password = value; },
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  icon: Icon(
                                      _isObscure ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  })),
                        ),
                      ),
                      // checkBox(),
                      SizedBox(height: size.height * 0.03),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        // width: size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                            color: Colors.orangeAccent[700],
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              // print(phoneNumber + ' ' + password);
                              final res = await Authenticate().login(phoneNumber, password);
                              final data = jsonDecode(res);
                              if (data['message'] == 'success') {
                                driver.password = password;
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.popAndPushNamed(context, '/home');
                                print('Login ' + data['message']);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Sai mật khẩu'),
                                  ),
                                  barrierDismissible: true,
                                );
                                print('Login ' + data['message']);
                              }
                            },
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                      )
                    ],
                  ),
                ),
                if (isLoading) CircularProgressIndicator(),
              ],
            ),
          ),
        )
      ),
    );
  }

  // Widget checkBox() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Checkbox(
  //         value: true,
  //         onChanged: (checked) => {}
  //       ),
  //       Text(
  //         'Lưu trạng thái đăng nhập',
  //         style: TextStyle(
  //           color: Colors.white
  //         )
  //       )
  //     ],
  //   );
  // }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Thoát ứng dụng'),
        content: new Text('Bạn có chắc muốn thoát không?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Có'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Không'),
          ),
        ],
      ),
    )) ?? false;
  }
}