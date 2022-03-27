import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_finder/dao/base_api.dart';
import 'package:http/http.dart' as http;

class AuthApi extends BaseApi{

  static const storage = FlutterSecureStorage();

   Future<http.Response> registration(String email, String password) async{
    var body = jsonEncode(
      {
        'email':email,
        'password':password
      }
    );
    http.Response response = await http.post(super.registrationAuth, headers: super.headers, body: body);
    return response;
  }

  Future<http.Response> login(String email, String password) async{
    var body = jsonEncode(
        {
          'email':email,
          'password':password
        }
    );
    http.Response response = await http.post(super.loginAuth, headers: super.headers, body: body);
    return response;
  }

  static void logout(){
     storage.write(key: "token", value: null);
  }


  static setToken(String token) async {
    await storage.write(key:'token', value:token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

}
