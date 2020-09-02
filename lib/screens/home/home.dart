import 'package:flutter/material.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarForHome(
        title1: 'Ana Sayfa',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                return await _auth.signOut();
              },
              child: Text('Çıkış Yap'),
            )
          ],
        ),
      ),
    );
  }
}
