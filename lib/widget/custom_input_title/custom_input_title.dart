import 'package:flutter/cupertino.dart';

import '../../provider/theme/theme_provider.dart';

class CustomInputTitle extends StatelessWidget {
  final String value;
  const CustomInputTitle({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 16,
        color: Color(ThemeProvider.theme["darkText"]),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
