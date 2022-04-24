import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';


class CustomDropdownMultiselect extends StatefulWidget {
  final List<String> items;
  final String text;
  final double? height;
  final double? fontSize;
  final List<String> selectedItems;
  const CustomDropdownMultiselect({Key? key, required this.items, required this.text, this.height, this.fontSize, required this.selectedItems}) : super(key: key);

  @override
  _CustomDropdownMultiselectState createState() => _CustomDropdownMultiselectState();
}

class _CustomDropdownMultiselectState extends State<CustomDropdownMultiselect> {
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        widget.selectedItems.add(itemValue);
      } else {
        widget.selectedItems.remove(itemValue);
      }
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
        return StatefulBuilder(
            builder: (context,setState){
              return AlertDialog(
                content: SingleChildScrollView(
                  child: ListBody(
                    children: widget.items.map((item) => CheckboxListTile(
                      value: widget.selectedItems.contains(item),
                      title: Text(item),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) {
                        setState(()=>_itemChange(item, isChecked!));
                      },
                    )).toList(),
                  ),
              )
        );
      });
    }
  );
}
