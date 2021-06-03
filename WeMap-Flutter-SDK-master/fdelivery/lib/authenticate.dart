import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter_session/flutter_session.dart';
import 'entity/driver.dart';

final url = 'https://fdelivery4driver.herokuapp.com';

class Authenticate {
  // ignore: non_constant_identifier_names
  // static final SESSION = FlutterSession();

  Future<dynamic> login(String phoneNumber, String password) async {
    var res = await http.post(
      '$url/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone_number': phoneNumber,
        'password': password,
      }),
    );
    driver = Driver.fromJson(jsonDecode(res.body));
    return res.body;
  }

  Future<dynamic> logout() async {
    var res = await http.get('$url/logout');
    // Authenticate.removeToken();
    return res.body;
  }

  Future<dynamic> changePassword(String driverId, String oldPassword, String newPassword, String reNewPassword) async {
    var res = await http.put(
      '$url/change-password',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'driverId': driverId,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'reNewPassword': reNewPassword,
      }),
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('Thay đổi trạng thái đơn hàng không thành công!');
    }
  }

  // static setToken(String token, String refreshToken) async {
  //   _AuthData data = _AuthData(token, refreshToken);
  //   return await SESSION.set('token', data);
  // }
  // static Future<Map<String, dynamic>> getToken() async {
  //   return await SESSION.get('token');
  // }
  // static removeToken() async {
  //   await SESSION.prefs.clear();
  // }
}

// class _AuthData {
//   String token, refreshToken;
//   _AuthData(this.token, this.refreshToken);
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['token'] = token;
//     data['refreshToken'] = refreshToken;
//     return data;
//   }
// }