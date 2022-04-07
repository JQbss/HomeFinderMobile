import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final double? fontSize;
  final Color? backgroundColor;

  const CustomButton({Key? key, required this.onPressed, required this.text, this.fontSize, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(backgroundColor ?? Color(ThemeProvider.theme["darkGreen"])),
                  ),
                  onPressed: ()=>onPressed(),
                  child: Text(
                    text.toLowerCase(),
                    style: TextStyle(
                      color: Color(ThemeProvider.theme["whiteText"]),
                      fontSize: fontSize ?? 20.0,
                    ),
                  ),
              ),
            ),
          ),
        ],
      );
  }
}
