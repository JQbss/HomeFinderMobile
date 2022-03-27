import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/screens/announcement/home_announcement.dart';
import 'package:home_finder/screens/home/login/login.dart';
import 'package:home_finder/screens/home/register/register.dart';
import 'package:home_finder/widget/custom_switch_button/custom_switch_button.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

import '../../provider/theme/theme_provider.dart';

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
  @override
  void initState(){
    super.initState();
    checkLoginHandler();
  }
  void checkLoginHandler() async {
    if(await AuthApi.getToken()!=null){
      Navigator.pushReplacement (
        context,
        MaterialPageRoute(builder: (context)=>const HomeAnnouncement()),
      );
    }
  }
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
  void changeState(bool isLogin){
    setState((){
      if(isLogin){
        onLeftPressedHandler();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-2.0, -2),
            end: const Alignment(-0.5, 0.5),
            colors: <Color>[
              Color(ThemeProvider.theme['gradientDark']),
              Color(ThemeProvider.theme['gradientLight'])
            ]
          )
        ),
        child: Stack(
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
                if(isRight) Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0,right: 50,top: 20),
                      child: Register(isChanged:changeState),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
