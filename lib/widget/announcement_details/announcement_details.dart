import 'package:flutter/material.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

class AnnouncementDetails extends StatelessWidget {

  final Announcement announcement;

  const AnnouncementDetails({Key? key, required this.announcement}) : super(key: key);

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
                const CustomTitle(value: "Szczegóły ogłoszenia"),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    announcement.title??"",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(ThemeProvider.theme["darkText"]),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                announcement.imageLinks!=null?
                Row(
                  children: [
                    Icon(Icons.arrow_back),

                  ],
                ):
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
                Row(
                  children: [
                    Icon(Icons.area_chart)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    announcement.description??"",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(ThemeProvider.theme["darkText"]),
                      fontWeight: FontWeight.w400,
                    ),
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
