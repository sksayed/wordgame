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
      endDrawer: SettingsDrawer(),
    );
  }

  buildBody() {
    return Center(
      child: Column(
        children: [],
      ),
    );
  }
}
