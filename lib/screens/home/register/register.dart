import 'package:flutter/material.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_checkbox/custom_checkbox.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailValidation = "";
  String passwordValidation="";
  bool isStatute = false;
  bool isPrivacy = false;

  registerHandler(){
    print(_formKey.currentState!.validate());
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
  }

  statuteHandler(bool? value){
    setState(() {
      isStatute=value!;
    });
  }

  privacyHandler(bool? value){
    setState((){
      isPrivacy = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: emailController,
              hint: "email",
              validator: (String? item){
                if(emailValidation!="") {
                  return emailValidation;
                }
                return null;
              },
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: CustomTextFormField(
                controller: passwordController,
                hint: "hasło",
                validator: (String? item){
                  if(passwordValidation!="") {
                    return passwordValidation;
                  }
                  return null;
                },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: CustomCheckbox(
                isChecked: isStatute,
                checkboxText: "akceptuje regulamin aplikacji",
                onCheckboxPressed: statuteHandler
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: CustomCheckbox(
              isChecked: isPrivacy,
              checkboxText: "akceptuje politykę prywtności",
              onCheckboxPressed: privacyHandler
            ),
          ),
          Expanded(
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CustomButton(onPressed: registerHandler, text: 'zarejestruj'),
                ),
                alignment: Alignment.bottomCenter,
              )
          ),

        ],
      ),
    );
  }
}
