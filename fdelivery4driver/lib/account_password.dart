import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';


class AccountPassword extends StatefulWidget {
  @override
  _AccountPassword createState() => _AccountPassword();
}

class _AccountPassword extends State<AccountPassword> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Container(
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
                        onChanged: (value) {},
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            hintText: 'Mật khẩu hiện tại',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
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
                        onChanged: (value) {},
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            hintText: 'Mật khẩu mới',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
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
                        onChanged: (value) {},
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            hintText: 'Nhập lại mật khẩu',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                })),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                          color: Colors.orangeAccent[700],
                          onPressed: () {
                            // Navigator.push(context, Schedule())
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return App(possition: 1);
                                },
                              ),
                            );
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
            ],
          ),
        )
    );
  }
}