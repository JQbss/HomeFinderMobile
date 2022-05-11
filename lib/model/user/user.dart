import 'package:home_finder/model/address/address.dart';

class User{
  final String? username;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final Address? address;

  User({this.username, this.phoneNumber, this.firstName, this.lastName,
      this.address});

  User.fromJson(Map<dynamic,dynamic> json)
  : username = json['username'],
    phoneNumber = json['phoneNumber'],
    firstName = json['firstName'],
    lastName = json['lastName'],
    address = json['address']!=null?Address.fromJson(json['address']):null;

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'username':username,
    'phoneNumber':phoneNumber,
    'firstName':firstName,
    'lastName':lastName,
    'address':address,
  };
}