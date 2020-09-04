import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/responsive_widget.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, constrains) {
        return Center(
          child: Text('Ayarlar'),
        );
      },
    );
  }
}
