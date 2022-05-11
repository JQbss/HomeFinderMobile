import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_finder/dao/auth_api.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/address/address.dart';
import 'package:home_finder/model/user/user.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/screens/home/home.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';
import '../../widget/custom_button/custom_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  UserApi userApi = UserApi();
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController wojewodztwoController = TextEditingController();
  TextEditingController powiatController = TextEditingController();
  TextEditingController miejscowoscController = TextEditingController();
  TextEditingController gminaController = TextEditingController();
  TextEditingController kodPocztowyController = TextEditingController();
  TextEditingController ulicaController = TextEditingController();
  TextEditingController numerDomuController = TextEditingController();
  TextEditingController numerMieszkaniaController = TextEditingController();

  void logoutHandler(){
    AuthApi.logout();
    Navigator.pushReplacement (
      context,
      MaterialPageRoute(builder: (context)=>const Home()),
    );
  }

  updateProfileHandler() async {
    Address address = Address(
      miejscowosc: miejscowoscController.text,
      gmina: gminaController.text,
      ulica: ulicaController.text,
      numerMieszkania: numerMieszkaniaController.text,
      numerDomu: numerDomuController.text,
      wojewodztwo: wojewodztwoController.text,
      kodPocztowy: kodPocztowyController.text,
      powiat: powiatController.text,
    );
    User user = User(
      address: address,
      phoneNumber: phoneNumberController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      username: userNameController.text
    );
    var req = await userApi.updateUser(user);
    if(req.statusCode==201){
      print("ok");
    }else{
      print(req.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: CustomButton(onPressed: logoutHandler, text: 'Wyloguj')),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: SvgPicture.asset('assets/logo.svg'),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomTitle(value: "Mój profil"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                        child: CustomDescription(value: "Login"),
                      ),
                      CustomTextFormField(controller: userNameController, hint: "wprowadź login",fontSize: 16,padding: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                        child: CustomDescription(value: "Imię"),
                      ),
                      CustomTextFormField(controller: firstNameController, hint: "wprowadź imie",fontSize: 16,padding: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                        child: CustomDescription(value: "Nazwisko"),
                      ),
                      CustomTextFormField(controller: lastNameController, hint: "wprowadź nazwisko",fontSize: 16,padding: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Divider(
                          color: Color(ThemeProvider.theme["dividerBlack"]),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                        child: CustomDescription(value: "Numer telefonu"),
                      ),
                      CustomTextFormField(controller: phoneNumberController, hint: "wprowadź numer telefonu",fontSize: 16,padding: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Divider(
                          color: Color(ThemeProvider.theme["dividerBlack"]),
                          thickness: 2,
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                              child: CustomDescription(value: "Miejscowość"),
                            )
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                            child: CustomDescription(value: "Gmina"),
                          )
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: CustomTextFormField(controller: miejscowoscController, hint: "miejscowość",fontSize: 16,padding: 8),
                          )),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: CustomTextFormField(controller: gminaController, hint: "gmina",fontSize: 16,padding: 8),
                          )),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                            child: CustomDescription(value: "Województwo"),
                          )
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                            child: CustomDescription(value: "Powiat"),
                          )
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: CustomTextFormField(controller: wojewodztwoController, hint: "województwo",fontSize: 16,padding: 8),
                          )),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: CustomTextFormField(controller: powiatController, hint: "powiat",fontSize: 16,padding: 8),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                        child: CustomDescription(value: "Kod pocztowy"),
                      ),
                      CustomTextFormField(controller: kodPocztowyController, hint: "wprowadź kod pocztowy",fontSize: 16,padding: 8),
                      Row(
                        children: const [
                          Expanded(
                            flex:2,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                              child: CustomDescription(value: "Ulica"),
                            ),
                          ),
                          Expanded(child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                              child: CustomDescription(value: "Numer domu"),
                            )
                          ),
                          Expanded(child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 10),
                              child: CustomDescription(value: "Numer mieszkania"),
                            )
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: CustomTextFormField(controller: ulicaController, hint: "ulica",fontSize: 16,padding: 8),
                            )
                          ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: CustomTextFormField(controller: numerDomuController, hint: "dom",fontSize: 16,padding: 8),
                          )),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: CustomTextFormField(controller: numerMieszkaniaController,fontSize: 16,padding: 8),
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Expanded(child: CustomButton(onPressed: ()=>{Navigator.of(context).pop()}, text: "anuluj", backgroundColor: Color(ThemeProvider.theme["errorRed"]))),
                            const SizedBox(width: 20),
                            Expanded(child: CustomButton(onPressed: updateProfileHandler, text: "dodaj"))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
