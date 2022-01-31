import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';


class CustomErrorText extends StatefulWidget {
  final String value;
  const CustomErrorText({Key? key, required this.value}) : super(key: key);

  @override
  _CustomErrorTextState createState() => _CustomErrorTextState();
}

class _CustomErrorTextState extends State<CustomErrorText> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.value,
        style: TextStyle(
          fontSize: 14,
          color: Color(ThemeProvider.theme["errorRed"]),
          fontWeight: FontWeight.w600,

        ),
      ),
    );
  }
}
