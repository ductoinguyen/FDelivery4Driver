import 'dart:convert';
import 'package:flutter/material.dart';
import '../authenticate.dart';
import '../entity/driver.dart';

class AccountPassword extends StatefulWidget {
  const AccountPassword({Key key});

  @override
  _AccountPasswordState createState() => _AccountPasswordState();
}

class _AccountPasswordState extends State<AccountPassword> {
  bool _currentObscure = true;
  bool _newObscure = true;
  bool _reNewObscure = true;

  bool isLoading = false;

  String oldPassword, newPassword, reNewPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
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
                  children: <Widget>[
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
                      child:
                      TextField(
                        onChanged: (value) { oldPassword = value; },
                        obscureText: _currentObscure,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu hiện tại',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _currentObscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _currentObscure = !_currentObscure;
                              });
                            })),
                      ),

                    ),
                    SizedBox(height: size.height * 0.03),
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
                        onChanged: (value) { newPassword = value; },
                        obscureText: _newObscure,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu mới',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _newObscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _newObscure = !_newObscure;
                              });
                            })),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
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
                        onChanged: (value) { reNewPassword = value; },
                        obscureText: _reNewObscure,
                        decoration: InputDecoration(
                          hintText: 'Nhập lại mật khẩu',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _reNewObscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _reNewObscure = !_reNewObscure;
                              });
                            })),
                      ),
                    ),
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
                            if (oldPassword != driver.password) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Mật khẩu cũ không đúng'),
                                ),
                                barrierDismissible: true,
                              );
                            } else if (oldPassword == newPassword) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Mật khẩu mới phải khác mật khẩu cũ'),
                                ),
                                barrierDismissible: true,
                              );
                            } else if (newPassword != reNewPassword) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Mật khẩu nhập lại không giống'),
                                ),
                                barrierDismissible: true,
                              );
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              // print(phoneNumber + ' ' + password);
                              final res = await Authenticate().changePassword(driver.id, oldPassword, newPassword, reNewPassword);
                              final data = jsonDecode(res);
                              if (data['message'] == 'success') {
                                driver.password = newPassword;
                                setState(() {
                                  isLoading = false;
                                });
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Đổi mật khẩu thành công'),
                                  ),
                                  barrierDismissible: true,
                                );
                                print('Change password ' + data['message']);
                              } else {
                                print('Change password ' + data['message']);
                              }
                            }
                          },
                          child: Text(
                            'Đổi mật khẩu',
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
              ),
              if (isLoading) CircularProgressIndicator(),
            ],
          ),
        ),
      )
    );
  }
}