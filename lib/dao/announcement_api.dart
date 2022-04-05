import 'dart:convert';

import 'package:home_finder/dao/base_api.dart';
import 'package:http/http.dart' as http;

import '../model/announcement/announcement.dart';

class AnnouncementApi extends BaseApi{
  Future<Announcement> getAll() async {
    http.Response response = await http.get(
        super.announcementUri, headers: super.headers);

    if(response.statusCode==200){
      print(response.body);
      return Announcement.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Wystąpił błąd");
    }
  }
}