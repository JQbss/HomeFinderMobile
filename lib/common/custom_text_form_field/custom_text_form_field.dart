import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget{

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  final Icon? icon;

  const CustomTextFormField({
    Key? key,
    this.hint,
    required this.controller,
    this.validator,
    this.icon
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
      validator: widget.validator,
    );
  }
}
