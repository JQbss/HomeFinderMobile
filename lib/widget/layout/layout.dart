import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class Layout extends StatelessWidget {
  final Widget widget;
  const Layout({Key? key,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-2.0, -2),
            end: const Alignment(-0.5, 0.5),
            colors: <Color>[
              Color(ThemeProvider.theme['gradientDark']),
              Color(ThemeProvider.theme['gradientLight'])
            ],
          ),
        ),
        child: widget,
      ),
    );
  }
}
