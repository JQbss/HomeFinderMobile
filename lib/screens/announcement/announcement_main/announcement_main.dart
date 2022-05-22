import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_finder/dao/announcement_api.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/model/announcement_response/announcement_response.dart';
import 'package:home_finder/model/pagination/pagination.dart';
import 'package:home_finder/widget/announcemet_widget/announcement_widget.dart';
import 'package:home_finder/widget/custom_pagination/custom_pagination.dart';

import '../../../model/enums/types_of_building.dart';
import '../../../provider/theme/theme_provider.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../widget/custom_description/custom_description.dart';
import '../../../widget/custom_dropdown_multiselect/custom_dropdown_multiselect.dart';
import '../../../widget/custom_text_form_field/custom_text_form_field.dart';
import '../../../widget/custom_title/custom_title.dart';

class AnnouncementMain extends StatefulWidget {
  const AnnouncementMain({Key? key}) : super(key: key);

  @override
  State<AnnouncementMain> createState() => _AnnouncementMainState();
}

class _AnnouncementMainState extends State<AnnouncementMain> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController localizationController = TextEditingController();


  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  TextEditingController metersFrom = TextEditingController();
  TextEditingController metersTo = TextEditingController();
  final List<String> selectedBuildingType = [];
  List<Announcement> list = [];
  Pagination pagination = Pagination(currentPage: 0, limit: 1, totalItems: 0, totalPages: 0);
  @override
  void initState(){
    getAnnouncementHandler({"limit":"10"});
    super.initState();
  }

  getAnnouncementHandler(Map<String,dynamic>? parameters)async{
    AnnouncementResponse response = await AnnouncementApi().getAll(parameters);
    setState(() {
      pagination = response.pagination;
      list = response.announcements;
    });
  }

  changePageHandler(int newVal) async{
    await getAnnouncementHandler({"page":newVal.toString(), "limit":"10"});
    CustomPagination.globalKey.currentState?.pagination=pagination;
    CustomPagination.globalKey.currentState?.getButtonsValues();

  }

  addToFavoriteHandler(int index){
    setState(() {
      if(list[index].isFavorite){
        UserApi().deleteFromFavorite(list[index].uid ?? "").then((value) {
          list[index].isFavorite = !list[index].isFavorite;
        });
      }else {
        UserApi().addToFavorite(list[index].uid ?? "").then((value) {
          list[index].isFavorite = !list[index].isFavorite;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
          ),
          Expanded(
            child: ListView(
              children: [
                for(int i=0; i<list.length; i++)
                  AnnouncementWidget(shortDesc: list[i].title,
                    price: list[i].price,
                    area: list[i].area,
                    address: list[i].address?.miejscowosc,
                    imageUrl: list[i].imageLinks!=null?list[i].imageLinks![0]:null,
                    isFavorite: list[i].isFavorite,
                    favoriteHandler: ()=>{addToFavoriteHandler(i)},

                  )
              ],
            ),
          ),
          pagination.totalPages>0?
          CustomPagination(pagination: pagination, changePage: (newVal)=>{changePageHandler(newVal)}):const SizedBox(),
        ],
      ),
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
            child: CustomDropdownMultiselect(items: listOfBuildingTypes(), text: "wybierz", selectedItems: selectedBuildingType),
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

