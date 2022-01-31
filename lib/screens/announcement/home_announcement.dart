import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';
import 'package:home_finder/widget/layout/layout.dart';
class HomeAnnouncement extends StatefulWidget {
  const HomeAnnouncement({Key? key}) : super(key: key);

  @override
  _HomeAnnouncementState createState() => _HomeAnnouncementState();
}

class _HomeAnnouncementState extends State<HomeAnnouncement> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController localizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Layout(
        widget: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width-140,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                      controller: localizationController,
                                      hint: "Wybierz lokalizację",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: SizedBox(
                                            width:MediaQuery.of(context).size.width/2-100,
                                            height: 30,
                                            child: CustomButton(
                                                fontSize: 14,
                                                onPressed: ()=>{},
                                                text: "filtry"),
                                          ),
                                        ),
                                        SizedBox(
                                          width:MediaQuery.of(context).size.width/2-50,
                                          height: 30,
                                          child: CustomButton(
                                            fontSize: 14,
                                            onPressed: ()=>{},
                                            text: "zaawansowane"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 90,
                            child: SvgPicture.asset('assets/logo.svg'),
                          ),
                        ],
                ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Divider(
                          color: Color(ThemeProvider.theme["dividerBlack"]),
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
              )
            ],
          ),
        )
    );
  }
}
