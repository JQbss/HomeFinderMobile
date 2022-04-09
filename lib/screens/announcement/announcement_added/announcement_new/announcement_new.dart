import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_finder/dao/announcement_api.dart';
import 'package:home_finder/widget/custom_button/custom_button.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_text_form_field/custom_text_form_field.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

import '../../../../model/announcement/announcement.dart';
import '../../../../model/enums/announcement_categories.dart';
import '../../../../model/enums/types_of_building.dart';
import '../../../../provider/theme/theme_provider.dart';
import '../../../../widget/custom_dropdown_multiselect/custom_dropdown_multiselect.dart';

class AnnouncementNew extends StatefulWidget {

  const AnnouncementNew({Key? key}) : super(key: key);

  @override
  State<AnnouncementNew> createState() => _AnnouncementNewState();
}

class _AnnouncementNewState extends State<AnnouncementNew> {

  AnnouncementApi announcementApi = AnnouncementApi();
  final _formKey = GlobalKey<FormState>();

  TextEditingController localizationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isPriceNegotiable = false;
  bool isFurnished = false;

  final List<String> selectedBuildingType=[];
  int selectedCategory=0;

  void changeCategory(int? newValue){
    setState(() {
      selectedCategory=newValue??0;
    });
  }

  void negotiableHandler(bool? newValue){
    setState(() {
      isPriceNegotiable=newValue??false;
    });
  }

  void furnishedHandler(bool? newValue){
    setState(() {
      isFurnished = newValue??false;
    });
  }

  void addAnnouncementHandler() async{
    Announcement announcement = Announcement(
      localization: localizationController.text,
      price: int.parse(priceController.text),
      area: double.parse(areaController.text),
      description: descriptionController.text,
      isPriceNegotiable: isPriceNegotiable,
      isFurnished: isFurnished,
      category: AnnouncementCategories.values[selectedCategory],
    );
    var req = await announcementApi.createAnnouncement(announcement);
    if(req.statusCode==201){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-2.0, -2),
              end: const Alignment(-0.5, 0.5),
              colors: <Color>[
                  Color(ThemeProvider.theme['gradientDark']),
                  Color(ThemeProvider.theme['gradientLight'])
                ]
            )
          ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomTitle(value: "Dodaj ogłoszenie"),
                  ),
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: SvgPicture.asset('assets/logo.svg'),
                  ),
                ],
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomDescription(value: "Dane podstawowe"),
                        Divider(
                          color: Color(ThemeProvider.theme["dividerBlack"]),
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10),
                          child: CustomDescription(value: "Rodzaj zabudowy"),
                        ),
                        CustomDropdownMultiselect(items: listOfBuildingTypes(), text: "wybierz rodzaj zabudowy", fontSize: 14, height: 30,selectedItems: selectedBuildingType),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10),
                          child: CustomDescription(value: "Lokalizacja"),
                        ),
                        CustomTextFormField(controller: localizationController, hint: "wprowadź lokalizację",fontSize: 14,padding: 8),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: CustomDescription(value: "Kategoria"),
                        ),
                        Row(
                          children: listOfAnnouncementCategories().map((item) => Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              value: listOfAnnouncementCategories().indexOf(item),
                              title: Padding(
                                padding: EdgeInsets.zero,
                                child: Transform.translate(
                                  offset: const Offset(-15,0),
                                  child: Text(
                                    item,
                                    style:TextStyle(
                                      fontSize: 14,
                                      color: Color(ThemeProvider.theme["darkText"]),
                                    ),
                                  ),
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: changeCategory,
                              groupValue: selectedCategory,

                            ),
                          )).toList(),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: CustomDescription(value: "Cena"),
                                    ),
                                    CustomTextFormField(controller: priceController, hint: "wprowadź cenę",fontSize: 14,padding: 8),
                                  ],
                                )
                            ),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: CheckboxListTile(
                                      value: isPriceNegotiable,
                                      onChanged: negotiableHandler,
                                     title:Transform.translate(
                                        offset: const Offset(-15,0),
                                        child: Text("Czy podlega negocjacji?",
                                          style:TextStyle(
                                            fontSize: 14,
                                            color: Color(ThemeProvider.theme["darkText"]),
                                        ),
                                      ),
                                     ),
                                    controlAffinity: ListTileControlAffinity.leading,
                                  ),
                                )
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 5),
                          child: CustomDescription(value: "Powierzchnia (m\u{00B2})"),
                        ),
                        CustomTextFormField(controller: areaController, hint: "wprowadź powierzchnię",fontSize: 14,padding: 8),
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          value: isFurnished,
                          onChanged: furnishedHandler,
                          title:Transform.translate(
                            offset: const Offset(-15,0),
                            child: Text("Czy umeblowane?",
                              style:TextStyle(
                                fontSize: 14,
                                color: Color(ThemeProvider.theme["darkText"]),
                              ),
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 5),
                          child: CustomDescription(value: "Opis"),
                        ),
                        CustomTextFormField(controller: descriptionController,fontSize: 14,padding: 8, maxLines: 6),
                        Expanded(
                          child: Align(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(child: CustomButton(onPressed: ()=>{Navigator.of(context).pop()}, text: "anuluj", backgroundColor: Color(ThemeProvider.theme["errorRed"]))),
                                  const SizedBox(width: 20),
                                  Expanded(child: CustomButton(onPressed: addAnnouncementHandler, text: "dodaj"))
                                ],
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ),

                      ],
                    ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
