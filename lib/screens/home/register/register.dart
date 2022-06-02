import 'package:flutter/material.dart';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_checkbox/custom_checkbox.dart';
import 'package:home_finder/widget/custom_error_text/custom_error_text.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';

class Register extends StatefulWidget {
  final Function isChanged;
  const Register({Key? key, required this.isChanged}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailValidation = "";
  String passwordValidation = "";
  String statuteValidation = "";
  String privacyValidation = "";
  bool isStatute = false;
  bool isPrivacy = false;

  AuthApi authApi = AuthApi();

  registerHandler() async{
    setState((){
      emailValidation="";
      passwordValidation="";
      privacyValidation="";
      statuteValidation="";
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
    if(!isPrivacy){
      setState((){
        privacyValidation = "Musisz zaakceptować politykę prywatności";
      });
    }
    if(!isStatute){
      setState((){
        statuteValidation = "Musisz zaakceptować regulamin";
      });
    }

    if(_formKey.currentState!.validate()){
      var req = await authApi.registration(emailController.text,passwordController.text);
        if(req.statusCode==201){
          widget.isChanged(true);
        }
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

              isPassword: true,
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
            padding: statuteValidation!=""? const EdgeInsets.only(top: 15.0):const EdgeInsets.all(0.0),
            child: CustomErrorText(
              value: statuteValidation,
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
            padding: privacyValidation!=""? const EdgeInsets.only(top: 15.0):const EdgeInsets.all(0.0),
            child: CustomErrorText(
              value: privacyValidation,
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
