import 'package:flutter/material.dart';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/screens/home/home.dart';
import '../../widget/custom_button/custom_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void logoutHandler(){
    AuthApi.logout();
    Navigator.pushReplacement (
      context,
      MaterialPageRoute(builder: (context)=>const Home()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomButton(onPressed: logoutHandler, text: 'Wyloguj'),
        ],
      ),
    );
  }
}
