import 'dart:convert';
import 'dart:io';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/dao/base_api.dart';
import 'package:home_finder/model/user/user.dart';
import 'package:http/http.dart' as http;
class UserApi extends BaseApi{

  Future<User> getUser() async{
    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    final String? uid = await AuthApi.getUid();
    final http.Response response = await http.get(
        Uri.http(super.usersUri.authority, super.usersUri.path+"/"+uid!),
        headers: newHeader);
    final result = json.decode(response.body);
    return User.fromJson(result);
  }

  Future<http.Response> updateUser(User user) async {

    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.patch(
        super.usersUri, headers: newHeader, body: jsonEncode(user.toJson()));

    return response;
  }
}