import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                      child: Ink.image(
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
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25,
                            offset: Offset(0, -8)
                        )
                      ]
                  ),
                  margin: EdgeInsets.only(top: 120),
                  padding: EdgeInsets.all(15),
                  child:
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                          child: Text(
                            "Login",
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
                           labelText: "PHONENUMBER",
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
                                  labelText: "PASSWORD",
                                  labelStyle:
                                  TextStyle(color: Color(0xff888888), fontSize: 15),

                                ),
                              ),
                              Text(
                                'SHOW',
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
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                  )
                                ),
                            ),

                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
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
                                  "NEW USER? SIGN UP",
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
                                  "FORGET PASSWORD",
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


class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          CarouselSlider(
            items:
            <Widget>[
              Image.asset('assets/logo(new).png'),
              Image.asset('assets/attribute(1).png'),
            ]
            ,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              aspectRatio: 508/283,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              initialPage: 0,
            ),
          ),
        ]
    );
  }
}