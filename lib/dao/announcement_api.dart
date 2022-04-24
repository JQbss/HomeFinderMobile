import 'dart:convert';
import 'dart:io';

import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/dao/base_api.dart';
import 'package:http/http.dart' as http;

import '../model/announcement/announcement.dart';

class AnnouncementApi extends BaseApi{
  Future<List<Announcement>> getAll() async {
    http.Response response = await http.get(
        super.announcementUri, headers: super.headers);

    if(response.statusCode==200){
      final result = json.decode(response.body).cast<Map<String, dynamic>>();
      return result.map<Announcement>((json)=>Announcement.fromJson(json)).toList();
    }else{
      throw Exception("Wystąpił błąd");
    }
  }

  Future<http.Response> createAnnouncement(Announcement announcement) async {

    final String token = (await AuthApi.getToken())??"";
    Map<String,String> newHeader = {'Content-Type': 'application/json', HttpHeaders.authorizationHeader: 'Bearer $token'};
    http.Response response = await http.post(
        super.announcementUri, headers: newHeader, body: jsonEncode(announcement.toJson()));

    return response;
  }
}