import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/responsive_widget.dart';
import 'package:ingilizceegitim/screens/home/home.dart';
import 'package:ingilizceegitim/screens/home/ranking.dart';
import 'package:ingilizceegitim/screens/home/settings.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int _currentIndex = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      bottomNavigationBar: buildBottomNavigationBar(),
      builder: (context, constrains) {
        return buildPageView();
      },
    );
  }

  PageView buildPageView() {
    return PageView(
      children: screens,
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  var screens = [
    Home(),
    RankingScreen(),
    Setting(),
  ];

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      iconSize: 28,
      currentIndex: _currentIndex,
      selectedItemColor: Color(0xffBA3E48),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          pageController.animateToPage(
            _currentIndex,
            duration: Duration(microseconds: 200),
            curve: Curves.linear,
          );
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Ana Ekran'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          title: Text('Liderlik Tablosu'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Ayarlar'),
        ),
      ],
    );
  }
}
