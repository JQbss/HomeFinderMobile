import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class Layout extends StatefulWidget {
  final Widget widget;
  final bool isNavbar;
  const Layout({Key? key, required this.widget, required this.isNavbar}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(

      bottomNavigationBar: widget.isNavbar? BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: "Mail"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person"
          )
        ],
      ):null,
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
        child: widget.widget,
      ),
    );
  }
}
