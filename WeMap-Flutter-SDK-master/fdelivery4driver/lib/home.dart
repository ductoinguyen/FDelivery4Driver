import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // button Nhận đơn
          Container(
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.orangeAccent
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child:
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.deepOrangeAccent,
                        // onSurface: Colors.lightBlueAccent,
                      ),
                      child: Container(
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.local_taxi),
                            Text(
                              "Nhận đơn",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )
                      )
                    )
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child:
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            MaterialCommunityIcons.alpha_p_circle,
                            color: Colors.white,
                          ),
                          Text(
                            "10 Điểm",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    )
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) {
                          return Colors.orangeAccent;
                        }
                    ),
                    foregroundColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) {
                          return Colors.white;
                        }
                    ),
                    shadowColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) {
                          return Colors.white12;
                        }
                    ),
                    overlayColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) {
                          return Colors.blue;
                        }
                    ),
                  ),
                  child: Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child:
                      Icon(
                        Icons.qr_code_scanner,
                        size: 35,
                        color: Colors.white,
                      )
                  ),
                )
              ]
            ),
          ),

          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFFF1F1F1),
            ),
            // padding: EdgeInsets.only(top: 10),
            child:
              Column(
                children: [
                  // 8 button
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeButton(
                          funcName: 'Giới thiệu',
                          background: 'assets/icon-color/icon(2).png',
                          icon: MaterialCommunityIcons.account_group,
                          usable: false,
                        ),
                        HomeButton(
                          funcName: 'Tín dụng',
                          background: 'assets/icon-color/icon(3).png',
                          icon: MaterialCommunityIcons.credit_card_multiple,
                          usable: false,
                        ),
                        HomeButton(
                          funcName: 'Chở hàng',
                          background: 'assets/icon-color/icon(5).png',
                          icon: MaterialCommunityIcons.truck,
                          usable: false,
                        ),
                        HomeButton(
                          funcName: 'Thuê xe',
                          background: 'assets/icon-color/icon(12).png',
                          icon: MaterialCommunityIcons.car,
                          usable: false,
                        ),
                      ]
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeButton(
                        funcName: 'Lịch sử',
                        background: 'assets/icon-color/icon(13).png',
                        icon: Icons.history,
                      ),
                      HomeButton(
                        funcName: 'Fast food',
                        background: 'assets/icon-color/icon(9).png',
                        icon: Icons.cake,
                        usable: false,
                      ),
                      HomeButton(
                        funcName: 'Bảo hiểm',
                        background: 'assets/icon-color/icon(10).png',
                        icon: MaterialCommunityIcons.shield_car,
                        usable: false,
                      ),
                      HomeButton(
                        funcName: 'Thêm',
                        background: 'assets/icon-color/icon(14).png',
                        icon: Icons.more_horiz,
                      ),
                    ]
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            color: Colors.white,
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'F4 Food',
                                    style: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Xem thêm',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400,
                                                )
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.grey,
                                                size: 10,
                                              )
                                            ],
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                left: 5,
                                top: 0,
                                right: 5,
                                bottom: 5
                              ),
                              child: Image.asset(
                                'assets/kfc-ads.png',
                                width: size.width,
                              ),
                            )
                          ]
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            color: Colors.white,
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'F4 Delivery',
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Xem thêm',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                            size: 10,
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                              left: 5,
                              top: 0,
                              right: 5,
                              bottom: 5
                            ),
                            child: CarouselDemo()
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'F4 Service',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xem thêm',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.grey,
                                        size: 10,
                                      )
                                    ],
                                  )
                                )
                              ],
                            )
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                              left: 5,
                              top: 0,
                              right: 5,
                              bottom: 5
                            ),
                            child: Image.asset(
                              'assets/banner.jpg',
                              width: size.width,
                            ),
                          )
                        ]
                      ),
                    ],
                  )
                ],
              )
          ),
        ]
      )
    );
  }
}

// ignore: must_be_immutable
class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: CarouselSlider(
        items:
          <Widget>[
            Image.asset('assets/service.png'),
            Image.asset('assets/delivery.png'),
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
    );
  }
}

class HomeButton extends StatelessWidget {
  final String funcName;
  final String background;
  final IconData icon;
  final bool usable;

  const HomeButton({Key key, @required this.funcName, @required this.background, @required this.icon, this.usable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child:
      Container(
        child:
        ElevatedButton(
          onPressed: () {
            if (!usable) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Tính năng không hỗ trợ'),
                  content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                ),
                barrierDismissible: true,
              );
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                  return Colors.white;
                }
            ),
            foregroundColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                  return Colors.black;
                }
            ),
            shadowColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                  return Colors.white12;
                }
            ),
            overlayColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                  return Colors.orangeAccent;
                }
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                // side: BorderSide(
                //   color: Colors.grey
                // )
              )
            )
          ),
          child:
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            height: 80,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  child:
                  DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(background),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
                Text(funcName,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87)
                )
              ],
            )
          ),
        ),
      )
    );
  }
}