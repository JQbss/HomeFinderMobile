import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          CustomTitle(value: "Twoje ogłoszenia")
        ],
      ),
    );
  }
}
