import 'package:flutter/material.dart';
import 'package:wordgame/screens/home/home.dart';
import 'package:wordgame/screens/home/ranking.dart';
import 'package:wordgame/screens/home/settings.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int _currentIndex = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildPageView(),
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
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
