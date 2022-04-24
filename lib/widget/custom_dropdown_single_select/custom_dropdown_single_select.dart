import 'package:flutter/material.dart';

import '../../provider/theme/theme_provider.dart';

class CustomDropdownSingleSelect extends StatefulWidget {
  final List<String> items;
  final String text;
  final double? height;
  final double? fontSize;
  final ValueSetter<int> selectItem;
  final int currentItem;
  const CustomDropdownSingleSelect({Key? key, required this.items, required this.text,
    this.height, this.fontSize, required this.selectItem, required this.currentItem}) : super(key: key);

  @override
  State<CustomDropdownSingleSelect> createState() => _CustomDropdownSingleSelectState();
}

class _CustomDropdownSingleSelectState extends State<CustomDropdownSingleSelect> {
  void changeCategory(int? newValue){
    setState(() {
      widget.selectItem(newValue??0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(

        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              )
          ),
          backgroundColor:MaterialStateProperty.all(Color(ThemeProvider.theme["lightGreen"])),
        ),
        onPressed: openDropdown,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text.toLowerCase(),
            style: TextStyle(
              color: Color(ThemeProvider.theme["darkText"]),
              fontSize: widget.fontSize ?? 20,
            ),
          ),
        ),
      ),

    );
  }
  Future openDropdown()=> showDialog(
      context: context,
      builder: (context) {
        int selected = widget.currentItem;
        return StatefulBuilder(
            builder: (context,setState){
              return AlertDialog(
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: widget.items.map((item) => RadioListTile(
                        value: widget.items.indexOf(item),
                        title: Text(item),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (int? value)=>{setState(()=>{changeCategory(value),selected=value??0})},
                        groupValue: selected,
                      )).toList(),
                    ),
                  )
              );
            });
      }
  );
}
