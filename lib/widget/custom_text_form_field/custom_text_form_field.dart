import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomTextFormField extends StatefulWidget{

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  final double? padding;
  final double? fontSize;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.hint,
    required this.controller,
    this.validator,
    this.padding,
    this.fontSize,
    this.maxLines
  }):super(key: key);

  @override
  _CustomTextFormField createState()=>_CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormField>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines??1,
      decoration: InputDecoration(

        isDense: true,
        fillColor: Color(ThemeProvider.theme["lightGreen"]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        hintText: widget.hint,
        contentPadding: EdgeInsets.only(left: 20,top: widget.padding??10,bottom: widget.padding??10,),
      ),
      validator: widget.validator,
      style: TextStyle(
        color: Color(ThemeProvider.theme["darkText"]),
        fontSize: widget.fontSize ?? 20.0,
      ),
    );
  }
}
