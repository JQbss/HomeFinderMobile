import 'package:flutter/material.dart';
import 'package:home_finder/screens/announcement/announcement_added/announcement_new/announcement_new.dart';

import '../../../provider/theme/theme_provider.dart';
import '../../../widget/custom_title/custom_title.dart';

class AnnouncementAdded extends StatefulWidget {
  const AnnouncementAdded({Key? key}) : super(key: key);

  @override
  State<AnnouncementAdded> createState() => _AnnouncementAddedState();
}

class _AnnouncementAddedState extends State<AnnouncementAdded> {
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitle(value: "Twoje ogłoszenia"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
