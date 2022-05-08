import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class PaginationButton extends StatefulWidget {
  final Text? text;
  final Icon? icon;
  const PaginationButton({Key? key, this.text, this.icon}) : super(key: key);

  @override
  State<PaginationButton> createState() => _PaginationButtonState();
}

class _PaginationButtonState extends State<PaginationButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child:
      Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: ElevatedButton(
          
          child: widget.icon??widget.text,
          onPressed: ()=>{},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: Color(ThemeProvider.theme["gradientDark"])
          ),
        ),
      )
    );
  }
}
