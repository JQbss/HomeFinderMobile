import 'package:flutter/material.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_switch_button/custom_switch_button.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';

class Login extends StatefulWidget{

  const Login({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() => _Login();

}

class _Login extends State<Login>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginHandler(){

  }

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          CustomTextFormField(controller: emailController,hint: "email"),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: CustomTextFormField(controller: passwordController,hint: "password"),
          ),
          Expanded(
              child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CustomButton(onPressed: ()=>{}, text: 'Zaloguj'),
                  ),
                alignment: Alignment.bottomCenter,
              )
          ),
        ],
    );
  }

}
