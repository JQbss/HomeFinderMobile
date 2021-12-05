import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  const Login({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() => _Login();

}

class _Login extends State<Login>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginHandler(){

  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
          )
        ],
      ),

    );
  }

}
