import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          CarouselDemo(),
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
            margin: EdgeInsets.only(top: size.height * 0.28),
            padding: EdgeInsets.all(15),
            child:
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child:
                              Container(
                                padding: EdgeInsets.only(right: 7.5),
                                child:
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orangeAccent,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.lightBlueAccent
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.local_taxi),
                                                Text(
                                                  "Nhận đơn",
                                                  style: TextStyle(fontSize: 15),
                                                )
                                              ],
                                            )

                                      )
                                  )
                              )
                        ),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child:
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset('assets/crown.png'),
                                          Text(
                                            "10 Điểm",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      )

                              )
                        ),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child:
                                ElevatedButton(
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
                                                        image: AssetImage('assets/icon-color/icon(2).png'),
                                                        fit: BoxFit.cover,
                                                      )
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                        MaterialCommunityIcons.account_group,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                ),
                                            ),
                                            Text('Giới thiệu',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child:
                                ElevatedButton(
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
                                                      image: AssetImage('assets/icon-color/icon(3).png'),
                                                      fit: BoxFit.cover,
                                                    )
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                      MaterialCommunityIcons.credit_card_multiple,
                                                      color: Colors.white,
                                                    )
                                                ),
                                              ),
                                            ),
                                            Text('Tín dụng',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child:
                                ElevatedButton(
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
                                                      image: AssetImage('assets/icon-color/icon(5).png'),
                                                      fit: BoxFit.cover,
                                                    )
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                      MaterialCommunityIcons.truck,
                                                      color: Colors.white,
                                                    )
                                                ),
                                              ),
                                            ),
                                            Text('Chở hàng',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child:
                                ElevatedButton(
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
                                                        image: AssetImage('assets/icon-color/icon(12).png'),
                                                        fit: BoxFit.cover,
                                                      )
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                        MaterialCommunityIcons.car_key,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                ),
                                              ),
                                              Text('Thuê xe',
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
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              child:
                                ElevatedButton(
                                  onPressed: () {},
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
                                                        image: AssetImage('assets/icon-color/icon(13).png'),
                                                        fit: BoxFit.cover,
                                                      )
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                        Icons.history,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                ),
                                              ),
                                              Text('Lịch sử',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              child:
                                ElevatedButton(
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
                                                          image: AssetImage('assets/icon-color/icon(9).png'),
                                                          fit: BoxFit.cover,
                                                        )
                                                    ),
                                                    child: Center(
                                                        child: Icon(
                                                          Icons.cake,
                                                          color: Colors.white,
                                                        )
                                                    ),
                                                  ),
                                                ),
                                                Text('Fast food',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              child:
                                ElevatedButton(
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
                                                          image: AssetImage('assets/icon-color/icon(10).png'),
                                                          fit: BoxFit.cover,
                                                        )
                                                    ),
                                                    child: Center(
                                                        child: Icon(
                                                          MaterialCommunityIcons.shield_car,
                                                          color: Colors.white,
                                                        )
                                                    ),
                                                  ),
                                                ),
                                                Text('Bảo hiểm',
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
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                            Container(
                              child:
                                ElevatedButton(
                                  onPressed: () {},
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
                                                          image: AssetImage('assets/icon-color/icon(11).png'),
                                                          fit: BoxFit.cover,
                                                        )
                                                    ),
                                                    child: Center(
                                                        child: Icon(
                                                          Icons.more_horiz,
                                                          color: Colors.white,
                                                        )
                                                    ),
                                                  ),
                                                ),
                                                Text('Thêm',
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
                      ),
                    ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child:
                    Image.asset(
                      'assets/banner.jpg',
                      width: size.width,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child:
                      Image.asset(
                        'assets/kfc-ads.png',
                        width: size.width,
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

// ignore: must_be_immutable
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