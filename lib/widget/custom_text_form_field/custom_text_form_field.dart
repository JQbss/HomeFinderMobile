import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomTextFormField extends StatefulWidget{

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    this.hint,
    required this.controller,
    this.validator,
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
      decoration: InputDecoration(
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

      ),
      validator: widget.validator,
      style: const TextStyle(color: Colors.black),
    );
  }
}
