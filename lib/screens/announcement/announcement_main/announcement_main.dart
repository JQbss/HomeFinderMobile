import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_finder/dao/announcement_api.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/model/announcement_response/announcement_response.dart';
import 'package:home_finder/model/pagination/pagination.dart';
import 'package:home_finder/widget/announcemet_widget/announcement_widget.dart';
import 'package:home_finder/widget/custom_pagination/custom_pagination.dart';

import '../../../provider/theme/theme_provider.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../widget/custom_description/custom_description.dart';
import '../../../widget/custom_text_form_field/custom_text_form_field.dart';
import '../../../widget/custom_title/custom_title.dart';

class AnnouncementMain extends StatefulWidget {
  const AnnouncementMain({Key? key}) : super(key: key);

  @override
  State<AnnouncementMain> createState() => _AnnouncementMainState();
}

class _AnnouncementMainState extends State<AnnouncementMain> {

  final _formKey = GlobalKey<FormState>();

  bool isAdvancedFilterEnabled = false;
  bool isDesk = false;
  bool isTeapot = false;
  bool isEspressoMaker = false;
  bool isArmchair = false;
  bool isSofa = false;
  bool isCommode = false;
  bool isChairs = false;
  bool isStove = false;
  bool isTableLamp = false;
  bool isRefrigerator = false;
  bool isBed = false;
  bool isMicrowave = false;
  bool isVacuum = false;
  bool isOven = false;
  bool isWindowShade = false;
  bool isBedsideTable = false;
  bool isTable = false;
  bool isWardrobe = false;
  bool isTV = false;
  bool isBathtub = false;
  bool isDishwasher = false;
  bool isIron = false;

  TextEditingController localizationController = TextEditingController();


  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  TextEditingController metersFrom = TextEditingController();
  TextEditingController metersTo = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
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

  searchAnnouncementHandler()async{
    Map<String,dynamic>? parameters = ({
      "limit":"10",
      "address__miejscowosc":localizationController.text,
      "price":'${priceFrom.text}:${priceTo.text}',
      "area":'${metersFrom.text}:${metersTo.text}',
      "title": title.text,
      "description": description.text
    });

    if(isAdvancedFilterEnabled){
      parameters.addAll({
        "furnishes__isBed":isBed.toString(),
        "furnishes__isTable":isTable.toString(),
        "furnishes__isBathtub":isBathtub.toString(),
        "furnishes__isArmchair":isArmchair.toString(),
        "furnishes__isBedsideTable":isBedsideTable.toString(),
        "furnishes__isChairs":isChairs.toString(),
        "furnishes__isCommode":isCommode.toString(),
        "furnishes__isDishwasher":isDishwasher.toString(),
        "furnishes__isEspressoMaker":isEspressoMaker.toString(),
        "furnishes__isIron":isIron.toString(),
        "furnishes__isMicrowave":isMicrowave.toString(),
        "furnishes__isOven":isOven.toString(),
        "furnishes__isRefrigerator":isRefrigerator.toString(),
        "furnishes__isSofa":isSofa.toString(),
        "furnishes__isStove":isStove.toString(),
        "furnishes__isTableLamp":isTableLamp.toString(),
        "furnishes__isTeapot":isTeapot.toString(),
        "furnishes__isTV":isTV.toString(),
        "furnishes__isVacuum":isVacuum.toString(),
        "furnishes__isWardrobe":isWardrobe.toString(),
        "furnishes__isWindowShade":isWindowShade.toString(),
        "furnishes__isDesk":isDesk.toString(),
      });
    };
    print(parameters);
    await getAnnouncementHandler(parameters);
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
                                        onPressed: openAdvancedFilter,
                                        text: "zaawansowane"),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                height: 30,
                                child: CustomButton(
                                    fontSize: 14,
                                    onPressed: searchAnnouncementHandler,
                                    text: "Szukaj"),
                              ),
                            ),
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index){
                return AnnouncementWidget(announcement: list[index]);
              }
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
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const CustomDescription(value: "Tytuł"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomTextFormField(
                    controller: title
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const CustomDescription(value: "Opis"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomTextFormField(
                    controller: description
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Future openAdvancedFilter () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const CustomTitle(value:"Zaawansowane filtry"),
        content: StatefulBuilder(
          builder:  (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isAdvancedFilterEnabled,
                          onChanged: (bool? value) {
                            setState(() {
                              isAdvancedFilterEnabled = value!;
                            });
                          }),
                      Text(
                        "Czy włączyć zaawansowane filtry?",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(ThemeProvider.theme["darkText"]),
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  if(isAdvancedFilterEnabled)
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isDesk,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isDesk = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Biurko")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isWindowShade,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isWindowShade = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Rolety")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isWardrobe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isWardrobe = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Garderoba")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isVacuum,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isVacuum = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Odkurzacz")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isTV,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isTV = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "TV")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isTeapot,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isTeapot = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Czajnik")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isTableLamp,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isTableLamp = value!;
                                      });
                                    }),
                                const Expanded(
                                  child: CustomDescription(
                                      value: "Lampka stołowa"),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isStove,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isStove = value!;
                                      });
                                    }),
                                const Expanded(
                                  child: CustomDescription(
                                      value: "Kuchenka"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isSofa,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isSofa = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Kanapa")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isRefrigerator,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isRefrigerator = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Lodówka")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isOven,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isOven = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Piekarnik")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isMicrowave,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isMicrowave = value!;
                                      });
                                    }),
                                const Expanded(
                                  child: CustomDescription(
                                      value: "Mikrofalówka"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isIron,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isIron = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Żelazko")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isEspressoMaker,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isEspressoMaker = value!;
                                      });
                                    }),
                                const Expanded(
                                  child: CustomDescription(
                                      value: "Ekspres do kawy"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isTable,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isTable = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Stół")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isBed,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isBed = value!;
                                      });
                                    }),
                                const Expanded(
                                  child: CustomDescription(
                                      value: "Łóżko"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isDishwasher,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isDishwasher = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Zmywarka")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isCommode,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCommode = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Komoda")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isChairs,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChairs = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Krzesła")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isBedsideTable,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isBedsideTable = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Stolik nocny")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isBathtub,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isBathtub = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Wanna")
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isArmchair,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isArmchair = value!;
                                      });
                                    }),
                                const CustomDescription(
                                    value: "Fotel")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      )
  );
}

