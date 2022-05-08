import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/model/pagination/pagination.dart';

class AnnouncementResponse{
  final Pagination pagination;
  final List<Announcement> announcements;

  AnnouncementResponse({required this.pagination, required this.announcements});

  AnnouncementResponse.fromJson(Map<dynamic,dynamic> json)
    : pagination = Pagination(
        currentPage: json['currentPage'],
        limit: json['limit'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages']
      ),
      announcements = json['items'].map<Announcement>((json)=>Announcement.fromJson(json)).toList();
}

//pagination.totalPages = json['totalPages'],
//       pagination.limit = json['limit'],
//       pagination.totalItems = json['totalItems'],
//       pagination.currentPage = json['currentPage'],