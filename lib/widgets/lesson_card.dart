import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final Color color;
  LessonCard({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: 162,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
