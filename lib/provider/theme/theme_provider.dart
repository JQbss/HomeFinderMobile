import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  static Map <String,dynamic> theme =CustomThemes.lightColors;
}

class CustomThemes{
  static Map<String,dynamic> lightColors = {
    "gradientDark": 0xffF2D57E,
    "gradientLight":0xffffffff,
    "inputBackground":0xFFB0D9CD,
    "darkText":0xFF275954
  };

}
