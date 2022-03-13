import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomDescription extends StatelessWidget {
  final String value;
  const CustomDescription({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 14,
        color: Color(ThemeProvider.theme["darkText"]),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
