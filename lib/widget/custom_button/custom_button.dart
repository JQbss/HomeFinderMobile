import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  const CustomButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

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
                    backgroundColor: MaterialStateProperty.all(Color(ThemeProvider.theme["darkGreen"])),
                  ),
                  onPressed: ()=>onPressed(),
                  child: Text(text),
              ),
            ),
          ),
        ],
      );
  }
}
