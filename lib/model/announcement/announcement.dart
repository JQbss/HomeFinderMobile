import 'package:home_finder/model/address/address.dart';
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
  final String? sellerUid;
  final List<dynamic>? imageLinks;
  final List<String>? images;
  final AnnouncementStatuses? status;
  final int? yearOfBuilding;
  final AnnouncementMarkets? announcementMarket;
  final List<AnnouncementAdditionalAreas>? additionalAreas;
  final Address? address;
  final String? link;
  bool isFavorite;

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
    this.sellerUid,
    this.imageLinks,
    this.status,
    this.yearOfBuilding,
    this.announcementMarket,
    this.additionalAreas,
    this.address,
    this.link,
    this.images,
    required this.isFavorite
  });

  Announcement.fromJson(Map<dynamic,dynamic> json)
  : uid = json['uid'],
    type = json['type'],
    category = AnnouncementCategories.values[json['category']??0],
    title = json['title'],
    description = json['description'],
    numberOfRooms = NumberOfRooms.values[json['numberOfRooms']??0],
    level = json['level'],
    isFurnished = json['isFurnished'],
    price = json['price'],
    isPriceNegotiable = json['isPriceNegotiable'],
    typeOfBuilding = TypesOfBuilding.values[json['typeOfBuilding']??0],
    additionalRent = json['additionalRent'],
    area = json['area']?.toDouble(),
    sellerUid = json['sellerUid'],
    imageLinks = json['imageLinks'],
    images = json['images'],
    status = json['status'],
    yearOfBuilding = json['yearOfBuilding'],
    announcementMarket = json['announcementMarket'],
    address=json['address']!=null?Address.fromJson(json['address']):null,
    additionalAreas = json['additionalAreas'],
    link = json['link'],

    isFavorite = json['favorite']??false
  ;

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
    'address':address,
    'sellerUid':sellerUid,
    'imageLinks':imageLinks,
    'status':status?.index,
    'yearOfBuilding':yearOfBuilding,
    'announcementMarket':announcementMarket?.index,
    'additionalAreas':additionalAreas,
    'link':link,
    'images':images,
  };
}
