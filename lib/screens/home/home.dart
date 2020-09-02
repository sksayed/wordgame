import 'package:flutter/material.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';
import 'package:ingilizceegitim/widgets/lesson_card.dart';
import 'package:ingilizceegitim/widgets/settings_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBarForHome(
        title1: 'Ana Sayfa',
        onPress: () => _scaffoldKey.currentState.openEndDrawer(),
      ),
      body: buildBody(),
      endDrawer: buildSettingsDrawer(context),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            searchField(),
            lessons(),
          ],
        ),
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Ders Ara",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.mic,
                color: Color(0xffBA3E48),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Column lessons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dersler',
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonCard(
              color: Color(0xff1FBB8B),
            ),
            SizedBox(width: 20),
            LessonCard(
              color: Color(0xff165567),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonCard(
              color: Color(0xffC17F3E),
            ),
            SizedBox(width: 20),
            LessonCard(
              color: Color(0xffCFC060),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonCard(
              color: Color(0xff1FBB8B),
            ),
            SizedBox(width: 20),
            LessonCard(
              color: Color(0xff165567),
            ),
          ],
        ),
      ],
    );
  }

  SettingsDrawer buildSettingsDrawer(BuildContext context) {
    return SettingsDrawer(
      logoutButton: () {
        Navigator.of(context).pop();
        buildShowDialog(context);
      },
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text(
            'Ana Ekran',
            style: TextStyle(
              color: Color(0xffBA3E48),
            ),
          ),
          icon: Icon(Icons.home),
          activeIcon: Icon(
            Icons.home,
            size: 30,
            color: Color(0xffBA3E48),
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Liderlik Tablosu'),
          icon: Icon(Icons.equalizer, size: 28),
          activeIcon: Icon(
            Icons.equalizer,
            size: 30,
            color: Color(0xffBA3E48),
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Ayarlar'),
          icon: Icon(Icons.settings, size: 28),
          activeIcon: Icon(
            Icons.settings,
            size: 30,
            color: Color(0xffBA3E48),
          ),
        ),
      ],
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Çıkış Yap"),
        content: new Text("Çıkış yapmak istediğine emin misin?"),
        actions: <Widget>[
          RaisedButton(
            color: Color(0xffEE9090),
            child: Text('Hayır'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            color: Color(0xffBA3E48),
            child: Text('Evet'),
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
