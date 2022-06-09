import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_finder/dao/user_api.dart';
import 'package:home_finder/model/announcement/announcement.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/announcement_details/announcement_details.dart';
import 'package:home_finder/widget/custom_description/custom_description.dart';
import 'package:home_finder/widget/custom_input_title/custom_input_title.dart';

class AnnouncementWidget extends StatefulWidget {
  final Announcement announcement;
  const AnnouncementWidget({Key? key, required this.announcement}) : super(key: key);

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnnouncementDetails(announcement: widget.announcement))
          );
        },
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
                        child: widget.announcement.imageLinks!=null?Image.network(
                          widget.announcement.imageLinks![0],
                            errorBuilder: (context, exception, stackTrace) {
                              return const Icon(Icons.hide_image_outlined);
                            },
                        ):const Icon(Icons.hide_image_outlined)
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 3,
                      child: IconButton(
                        icon: widget.announcement.isFavorite?const Icon(
                          Icons.favorite,
                          size: 35,
                        ):const Icon(
                          Icons.favorite_border,
                          size: 35,
                        ),
                        onPressed: addToFavoriteHandler,
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
                          Flexible(child: CustomDescription(value: widget.announcement.title??"")),
                        ],
                      ),
                      Row(
                        children: [
                          CustomInputTitle(value: widget.announcement.price.toString()+" zł"),
                          const Expanded(child: SizedBox()),
                          if(widget.announcement.area!=null)
                            CustomInputTitle(value: widget.announcement.area.toString()+" m\u{00B2}")
                        ],
                      ),
                      Row(
                        children: [
                          CustomDescription(value: widget.announcement.address?.miejscowosc??""),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
