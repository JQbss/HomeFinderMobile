import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_input_title/custom_input_title.dart';

class AnnouncementWidget extends StatefulWidget {
  final String? imageUrl;
  final String? shortDesc;
  final int? price;
  final double? area;
  final String? address;
  final bool isFavorite;
  final void Function() favoriteHandler;
  const AnnouncementWidget({Key? key, this.imageUrl, required this.shortDesc,
    required this.price, required this.area, required this.address, required this.isFavorite, required this.favoriteHandler}) : super(key: key);

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Color(ThemeProvider.theme["lightGreen"]),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20.0)),)
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: widget.imageUrl!=null?Image.network(widget.imageUrl!):const Icon(Icons.hide_image_outlined)
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 3,
                    child: IconButton(
                      icon: widget.isFavorite?const Icon(
                        Icons.favorite,
                        size: 35,
                      ):const Icon(
                        Icons.favorite_border,
                        size: 35,
                      ),
                      onPressed: widget.favoriteHandler,
                    )
                  )
                ],
              ),
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
                        Flexible(child: CustomDescription(value: widget.shortDesc??"")),
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
                        CustomDescription(value: widget.address??""),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
