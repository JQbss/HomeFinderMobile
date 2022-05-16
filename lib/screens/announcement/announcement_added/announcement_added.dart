import 'package:flutter/material.dart';
import 'package:home_finder/dao/announcement_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/screens/announcement/announcement_added/announcement_new/announcement_new.dart';
import 'package:home_finder/widget/announcemet_widget/announcement_widget.dart';

import '../../../provider/theme/theme_provider.dart';
import '../../../widget/custom_title/custom_title.dart';

class AnnouncementAdded extends StatefulWidget {
  const AnnouncementAdded({Key? key}) : super(key: key);

  @override
  State<AnnouncementAdded> createState() => _AnnouncementAddedState();
}

class _AnnouncementAddedState extends State<AnnouncementAdded> {
  List<Announcement> list = [];
  @override
  void initState() {
    getAnnouncementHandler();
    super.initState();

  }

  getAnnouncementHandler() {
   AnnouncementApi().getMainAnnouncements().then((response) {
     setState(() {
       list = response.announcements;
     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnnouncementNew()),
                );
              },
              child: const Icon(Icons.add),
              backgroundColor: Color(ThemeProvider.theme["darkGreen"]),
            )
          ),
          const CustomTitle(value: "Twoje ogłoszenia"),

          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: ListView(
              children: [
                for(int i=0; i<list.length; i++)
                  AnnouncementWidget(shortDesc: list[i].title,
                    price: list[i].price,
                    area: list[i].area,
                    address: list[i].address?.miejscowosc,
                    imageUrl: list[i].imageLinks!=null?list[i].imageLinks![0]:null,
                    isFavorite: false,
                    favoriteHandler: ()=>{},
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
