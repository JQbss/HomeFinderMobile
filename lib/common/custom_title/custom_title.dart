import 'package:flutter/cupertino.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomTitle extends StatelessWidget {
  final String value;
  const CustomTitle({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 30,
        color: Color(ThemeProvider.theme["darkText"]),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
