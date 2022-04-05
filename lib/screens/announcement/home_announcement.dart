
import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/screens/announcement/announcement_added/announcement_added.dart';
import 'package:home_finder/screens/announcement/announcement_main/announcement_main.dart';
import 'package:home_finder/screens/announcement/announcement_selected/announcement_selected.dart';
import 'package:home_finder/screens/profile/profile.dart';
class HomeAnnouncement extends StatefulWidget {
  const HomeAnnouncement({Key? key}) : super(key: key);

  @override
  _HomeAnnouncementState createState() => _HomeAnnouncementState();
}

class _HomeAnnouncementState extends State<HomeAnnouncement> {

  int index=0;
  PageController pageController = PageController();

  void navigationHandler(int newIndex){
    pageController.jumpToPage(newIndex);
  }

  void indexHandler(int newIndex){
    setState(() {
      index=newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: navigationHandler,
        backgroundColor: Color(ThemeProvider.theme["darkGreen"]),
        unselectedItemColor: Color(ThemeProvider.theme["whiteText"]),
        selectedItemColor: Color(ThemeProvider.theme["gradientDark"]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Wybrane"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "Dodane"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil"
          )
        ],
      ),
      body: Container(
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
        child: PageView(
          controller: pageController,
          onPageChanged: indexHandler,
          children: const [
            AnnouncementMain(),
            AnnouncementSelected(),
            AnnouncementAdded(),
            Profile(),
          ],
        ),
      )
    );
  }
}
