import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomDropdownMultiselect extends StatefulWidget {
  final List<String> items;
  final String text;
  const CustomDropdownMultiselect({Key? key, required this.items, required this.text}) : super(key: key);

  @override
  _CustomDropdownMultiselectState createState() => _CustomDropdownMultiselectState();
}

class _CustomDropdownMultiselectState extends State<CustomDropdownMultiselect> {
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width/1.5,
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
        child: Text(
          widget.text.toLowerCase(),
          style: TextStyle(
            color: Color(ThemeProvider.theme["darkText"]),
            fontSize: 20.0,
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
                      value: _selectedItems.contains(item),
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
