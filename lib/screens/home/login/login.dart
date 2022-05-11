import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/screens/announcement/home_announcement.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';

class Login extends StatefulWidget{

  const Login({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() => _Login();

}

class _Login extends State<Login>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailValidation = "";
  String passwordValidation = "";
  AuthApi authApi = AuthApi();
  loginHandler()async{
    setState((){
      emailValidation="";
      passwordValidation="";
    });
    if(emailController.text==""){
      setState(() {
        emailValidation = "Email nie może być pusty";
      });
    }
    if(passwordController.text==""){
      setState(() {
        passwordValidation = "Hasło nie może być puste";
      });
    }
    if(_formKey.currentState!.validate()) {
      var req = await authApi.login(
          emailController.text, passwordController.text);
      if (req.statusCode == 200) {
        Map<String,dynamic> json = jsonDecode(req.body);
        await AuthApi.setToken(json['idToken']);
        await AuthApi.setUid(json['localId']);
        Navigator.pushReplacement (
            context,
            MaterialPageRoute(builder: (context)=>const HomeAnnouncement()),

        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
          children: [
            CustomTextFormField(
                controller: emailController,
                validator: (String? item){
                  if(emailValidation!="") {
                    return emailValidation;
                  }
                  return null;
                },
                hint: "email"),
            Padding(
              padding: const EdgeInsets.only(top:15.0),

              child: CustomTextFormField(
                  controller: passwordController,
                  validator: (String? item){
                    if(passwordValidation!="") {
                      return passwordValidation;
                    }
                    return null;
                  },
                  hint: "hasło"),
            ),
            Expanded(
                child: Align(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomButton(onPressed: loginHandler, text: 'Zaloguj'),
                    ),
                  alignment: Alignment.bottomCenter,
                )
            ),
          ],
      ),
    );
  }

}
