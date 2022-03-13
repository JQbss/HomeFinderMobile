
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_dropdown_multiselect/custom_dropdown_multiselect.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';
import 'package:home_finder/widget/layout/layout.dart';
class HomeAnnouncement extends StatefulWidget {
  const HomeAnnouncement({Key? key}) : super(key: key);

  @override
  _HomeAnnouncementState createState() => _HomeAnnouncementState();
}

class _HomeAnnouncementState extends State<HomeAnnouncement> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController localizationController = TextEditingController();

  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  TextEditingController metersFrom = TextEditingController();
  TextEditingController metersTo = TextEditingController();
  List<String> test = ["test1", "test2"];
  final List<String> selectedItems = [];
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }
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
                                                onPressed: openFilter,
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
                          SizedBox(
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

  Future openFilter()=> showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const CustomTitle(value:"Podstawowe filtry"),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const CustomDescription(value: "Rodzaj zabudowy"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CustomDropdownMultiselect(items: test, text: "wybierz"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const CustomDescription(value: "Cena"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0,bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: const CustomDescription(value: "Od"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: const CustomDescription(value: "Do"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: CustomTextFormField(
                      controller: priceFrom
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.1,
                child: CustomTextFormField(
                    controller: priceTo
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10,top: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const CustomDescription(value: "Powierzechnia (m\u{00B2})"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0,bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: const CustomDescription(value: "Od"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: const CustomDescription(value: "Do"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                  child: CustomTextFormField(
                      controller: metersFrom
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.1,
                child: CustomTextFormField(
                    controller: metersTo
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
