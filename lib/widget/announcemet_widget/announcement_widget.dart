import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_input_title/custom_input_title.dart';

class AnnouncementWidget extends StatefulWidget {
  final String? imageUrl;
  final String shortDesc;
  final double price;
  final double area;
  final String address;
  const AnnouncementWidget({Key? key, this.imageUrl, required this.shortDesc, required this.price, required this.area, required this.address}) : super(key: key);

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(ThemeProvider.theme["lightGreen"]),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20.0)),
              ),
              child: Icon(Icons.hide_image_outlined),),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(ThemeProvider.theme["lightGreen"]),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomDescription(value: widget.shortDesc),
                    ],
                  ),
                  Row(
                    children: [
                      CustomInputTitle(value: widget.price.toString()+" zł"),
                      const Expanded(child: SizedBox()),
                      CustomInputTitle(value: widget.area.toString()+" m\u{00B2}")
                    ],
                  ),
                  Row(
                    children: [
                      CustomDescription(value: widget.address),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
