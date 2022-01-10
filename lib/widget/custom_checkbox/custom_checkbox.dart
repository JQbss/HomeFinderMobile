import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomCheckbox extends StatefulWidget {

  final bool isChecked;
  final String checkboxText;
  final Function onCheckboxPressed;

  const CustomCheckbox({Key? key, required this.checkboxText, required this.onCheckboxPressed, required this.isChecked}) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  onCheckHandler(bool? value){
    widget.onCheckboxPressed(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 15,
            width: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Color(ThemeProvider.theme["darkGreen"])),
                child: Checkbox(
                    value: widget.isChecked,
                    onChanged:onCheckHandler,
                    activeColor: Color(ThemeProvider.theme["darkGreen"]),
                ),
              ),
            ),

        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.checkboxText,
            style: TextStyle(
              fontSize: 14,
              color: Color(ThemeProvider.theme["darkText"])
            ),
          ),
        )
      ],
    );
  }
}
