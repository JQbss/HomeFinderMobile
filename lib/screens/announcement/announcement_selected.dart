import 'package:flutter/material.dart';
import 'package:home_finder/widget/custom_title/custom_title.dart';

class AnnouncementSelected extends StatefulWidget {
  const AnnouncementSelected({Key? key}) : super(key: key);
  
  @override
  State<AnnouncementSelected> createState() => _AnnouncementSelectedState();
}

class _AnnouncementSelectedState extends State<AnnouncementSelected> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTitle(value: "Wybrane ogłoszenia")
        ],
      ),
    );
  }
}
