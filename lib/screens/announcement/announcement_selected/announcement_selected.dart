import 'package:flutter/material.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/model/announcement_response/announcement_response.dart';
import 'package:home_finder/widget/announcemet_widget/announcement_widget.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

class AnnouncementSelected extends StatefulWidget {
  const AnnouncementSelected({Key? key}) : super(key: key);
  
  @override
  State<AnnouncementSelected> createState() => _AnnouncementSelectedState();
}

class _AnnouncementSelectedState extends State<AnnouncementSelected> {

  List<Announcement> list = [];
  @override
  void initState() {
    super.initState();
    getAnnouncementHandler();
  }

  getAnnouncementHandler() async {
    AnnouncementResponse response = await UserApi().getFavoritesAnnouncements();
    setState(() {
      list = response.announcements;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [

          const Center(
            child: CustomTitle(value: "Twoje ulubione ogłoszenia")
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: ListView(
                children: [
                  for(int i=0; i<list.length; i++)
                    AnnouncementWidget(announcement: list[i])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
