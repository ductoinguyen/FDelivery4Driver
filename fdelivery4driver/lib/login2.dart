import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';


class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
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
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
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
                      onChanged: (value) {},
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          hintText: 'Password',
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
                    // TextField(
                    //   obscureText: true,
                    //   onChanged: (value) {},
                    //   cursorColor: Color(0xFF0E0E09),
                    //   decoration: InputDecoration(
                    //     hintText: "Mật khẩu",
                    //     border: InputBorder.none,
                    //   ),
                    // ),
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
                                return App();
                              },
                            ),
                          );
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Quên mật khẩu",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}