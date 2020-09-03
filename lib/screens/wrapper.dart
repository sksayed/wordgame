import 'package:flutter/material.dart';
import 'package:ingilizceegitim/models/user.dart';
import 'package:ingilizceegitim/screens/auth/auth.dart';
import 'package:ingilizceegitim/screens/home/screen_controller.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Auth();
    } else {
      return ScreenController();
    }
  }
}
