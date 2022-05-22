import 'dart:convert';
import 'dart:io';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/dao/base_api.dart';
import 'package:home_finder/model/announcement_response/announcement_response.dart';
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
    final String? uid = await AuthApi.getUid();
    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.patch(
        Uri.http(super.usersUri.authority,super.usersUri.path+"/"+uid!), headers: newHeader, body: jsonEncode(user.toJson()));

    return response;
  }

  Future<http.Response> addToFavorite(String uid) async {
    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.post(
      Uri.http(super.userFavoriteUri.authority, super.userFavoriteUri.path+"/"+uid), headers: newHeader);

    return response;
  }

  Future<http.Response> deleteFromFavorite(String uid) async {
    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.delete(
        Uri.http(super.userFavoriteUri.authority, super.userFavoriteUri.path+"/"+uid), headers: newHeader);

    return response;
  }

  Future<AnnouncementResponse> getFavoritesAnnouncements() async{
    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.get(super.userFavoriteUri, headers: newHeader);
    if(response.statusCode==200){
      final result = json.decode(response.body).cast<Map<String,dynamic>>();
      AnnouncementResponse announcementResponse = AnnouncementResponse.fromJson(result[0]);
      return announcementResponse;
    }else{
      throw Exception("Wystąpił błąd");
    }
  }
}