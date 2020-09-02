import 'package:flutter/material.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';
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
      endDrawer: SettingsDrawer(
        logoutButton: () {
          Navigator.of(context).pop();
          buildShowDialog(context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            title: Text(''),
            icon: Icon(Icons.assessment,size: 28),
            activeIcon: Icon(
              Icons.assessment,
              size: 30,
              color: Color(0xffBA3E48),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            
            icon: Icon(Icons.settings,size: 28),
            activeIcon: Icon(
              Icons.settings,
              size: 30,
              color: Color(0xffBA3E48),
            ),
          ),
        ],
      ),
    );
  }

  buildBody() {
    return Center(
      child: Column(
        children: [],
      ),
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
