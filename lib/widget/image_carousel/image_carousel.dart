import 'package:flutter/material.dart';
class ImageCarousel extends StatefulWidget {

  final List<dynamic> images;
  const ImageCarousel({Key? key, required this.images}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: widget.images.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page){
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, pagePosition){
          return Container(
            margin: const EdgeInsets.all(10),
            child: Image.network(widget.images[pagePosition]),
          );
        },
      ),
    );
  }
}
