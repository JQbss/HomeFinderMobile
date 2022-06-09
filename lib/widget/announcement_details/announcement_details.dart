import 'package:flutter/material.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';
import 'package:home_finder/widget/image_carousel/image_carousel.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementDetails extends StatefulWidget {
  final Announcement announcement;
  const AnnouncementDetails({Key? key, required this.announcement}) : super(key: key);

  @override
  State<AnnouncementDetails> createState() => _AnnouncementDetailsState();
}

class _AnnouncementDetailsState extends State<AnnouncementDetails> {

  addToFavoriteHandler () async{
    if(widget.announcement.isFavorite){
      await UserApi().deleteFromFavorite(widget.announcement.uid ?? "");
    }else{
      await UserApi().addToFavorite(widget.announcement.uid ?? "");
    }
    setState(() {
      if(widget.announcement.isFavorite){
        widget.announcement.isFavorite = false;
      }else{
        widget.announcement.isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const CustomTitle(value: "Szczegóły ogłoszenia"),
                    IconButton(
                      icon: widget.announcement.isFavorite?const Icon(
                        Icons.favorite,
                        size: 35,
                      ):const Icon(
                        Icons.favorite_border,
                        size: 35,
                      ),
                      onPressed: addToFavoriteHandler,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    widget.announcement.title??"",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(ThemeProvider.theme["darkText"]),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                widget.announcement.imageLinks!=null?
                ImageCarousel(images: widget.announcement.imageLinks!):
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Color(ThemeProvider.theme['lightGray']),
                      borderRadius: const BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: const Icon(
                    Icons.hide_image_outlined,
                    size: 70.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(widget.announcement.area != null)
                        Row(
                          children: [
                            const Icon(Icons.home_work_outlined ),
                            Text(
                              ' ${widget.announcement.area!.toString()} m\u{00B2}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(ThemeProvider.theme["darkText"]),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          const Icon(Icons.money_outlined ),
                          Text(
                            ' ${widget.announcement.price!.toString()} zł',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(ThemeProvider.theme["darkText"]),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_city_outlined ),
                          Text(
                            ' ${widget.announcement.address?.miejscowosc}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(ThemeProvider.theme["darkText"]),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      if(widget.announcement.address?.ulica != null)
                        Row(
                          children: [
                            const Icon(Icons.edit_road_outlined),
                            Text(
                              ' ${widget.announcement.address?.ulica}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(ThemeProvider.theme["darkText"]),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    widget.announcement.description??"",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(ThemeProvider.theme["darkText"]),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if(widget.announcement.link != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        const Icon(Icons.web_outlined),
                        InkWell(
                          onTap: () async=>  {
                            await launchUrl(Uri.parse(widget.announcement.link!))
                          },
                          child: Text(
                            " Otwórz link",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(ThemeProvider.theme["darkText"]),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          /*child: Padding(
              padding: const EdgeInsets.all(20.0),

          ),*/
        ),
      ),
    );
  }
}