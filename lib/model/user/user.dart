import 'dart:core';

class User{
  final String email;
  final String password;

  User(this.email, this.password);

  User.fromJson(Map<String,dynamic> json)
    :email=json['email'] as String, password=json['password'] as String;

  Map<String, dynamic> toJson() => {
    'email': email,
    'password':password
  };

}
