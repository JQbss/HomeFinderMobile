import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_finder/screens/home/login/login.dart';
import 'package:home_finder/screens/home/register/register.dart';
import 'package:home_finder/widget/custom_switch_button/custom_switch_button.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

class Home extends StatefulWidget{

  const Home({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();

}

class _Home extends State<Home> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLeft = false;
  bool isRight = false;

  void onLeftPressedHandler(){
    setState(() {
      isLeft=true;
      isRight = false;
    });
  }

  void onRightPressedHandler(){
    setState(() {
      isLeft=false;
      isRight = true;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/home_light_line.svg',
              width: MediaQuery.of(context).size.width/2.2,
            )
        ),
        Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/road_green.svg',
              width: MediaQuery.of(context).size.width,
            )
        ),

        Column(
          children:[
            Container(
              margin: const EdgeInsets.only(top: 75),
              child: SvgPicture.asset('assets/logo.svg'),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15),
                child:const CustomTitle(value: "Home Finder")
            ),
            CustomSwitchButton(
                textLeft: "Zaloguj",
                textRight: "Zarejestruj",
                onPressedLeft: onLeftPressedHandler,
                onPressedRight: onRightPressedHandler
            ),
            if (isLeft) const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 50.0,right: 50,top: 20),
                child: Login(),
              ),
            ),
            if(isRight) const Expanded(
            child: Padding(
            padding: EdgeInsets.only(left: 50.0,right: 50,top: 20),
            child: Register(),
            )),
          ],
        ),
      ],
    );
  }

}
