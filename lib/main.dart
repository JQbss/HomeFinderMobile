import 'package:flutter/material.dart';
import 'package:home_finder/widget/layout/layout.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/screens/home/home.dart';
import 'package:home_finder/screens/home/login/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomeFinder());
}

class HomeFinder extends StatelessWidget {
  const HomeFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider (
    providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
    ],
    child: Builder(
      builder: (context){
        {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Layout(widget: Home())
          );
        }
      }
    ),
  );
}
