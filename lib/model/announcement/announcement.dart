import 'package:home_finder/model/enums/announcement_additional_areas.dart';
import 'package:home_finder/model/enums/announcement_categories.dart';
import 'package:home_finder/model/enums/announcement_markets.dart';
import 'package:home_finder/model/enums/announcement_statuses.dart';
import 'package:home_finder/model/enums/level_of_building.dart';

import '../enums/announcement_types.dart';
import '../enums/number_of_rooms.dart';
import '../enums/types_of_building.dart';

class Announcement{
  final String? uid;
  final AnnouncementTypes? type;
  final AnnouncementCategories? category;
  final String? title;
  final String? description;
  final NumberOfRooms? numberOfRooms;
  final LevelOfBuilding? level;
  final bool? isFurnished;
  final int? price;
  final bool? isPriceNegotiable;
  final TypesOfBuilding? typeOfBuilding;
  final int? additionalRent;
  final double? area;
  final String? localization;
  final String? sellerUid;
  final List<String>? imageLinks;
  final AnnouncementStatuses? status;
  final int? yearOfBuilding;
  final AnnouncementMarkets? announcementMarket;
  final List<AnnouncementAdditionalAreas>? additionalAreas;
  final String? link;

  Announcement({
    this.uid,
    this.type,
    this.category,
    this.title,
    this.description,
    this.numberOfRooms,
    this.level,
    this.isFurnished,
    this.price,
    this.isPriceNegotiable,
    this.typeOfBuilding,
    this.additionalRent,
    this.area,
    this.localization,
    this.sellerUid,
    this.imageLinks,
    this.status,
    this.yearOfBuilding,
    this.announcementMarket,
    this.additionalAreas,
    this.link
  });

  Announcement.fromJson(Map<dynamic,dynamic> json)
  : uid = json['Uid'],
    type = json['type'],
    category = json['category'],
    title = json['title'],
    description = json['description'],
    numberOfRooms = json['numberOfRooms'],
    level = json['level'],
    isFurnished = json['isFurnished'],
    price = json['price'],
    isPriceNegotiable = json['isPriceNegotiable'],
    typeOfBuilding = json['typeOfBuilding'],
    additionalRent = json['additionalRent'],
    area = json['area'],
    localization = json['localization'],
    sellerUid = json['sellerUid'],
    imageLinks = json['imageLinks'],
    status = json['status'],
    yearOfBuilding = json['yearOfBuilding'],
    announcementMarket = json['announcementMarket'],
    additionalAreas = json['additionalAreas'],
    link = json['link'];

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'Uid':uid,
    'type':type?.index,
    'category':category?.index,
    'title':title,
    'description':description,
    'numberOfRooms':numberOfRooms?.index,
    'level':level?.index,
    'isFurnished':isFurnished,
    'price':price,
    'isPriceNegotiable':isPriceNegotiable,
    'typeOfBuilding':typeOfBuilding?.index,
    'additionalRent':additionalRent,
    'area':area,
    'localization':localization,
    'sellerUid':sellerUid,
    'imageLinks':imageLinks,
    'status':status?.index,
    'yearOfBuilding':yearOfBuilding,
    'announcementMarket':announcementMarket?.index,
    'additionalAreas':additionalAreas,
    'link':link,
  };
}
