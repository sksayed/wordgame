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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20),
          imageIcon(),
          buildContainer(),
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      child: Column(
        children: [
          SizedBox(height:13),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              '2/6',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            alignment: Alignment.topLeft,
            child: Text(
              'Meslekler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 22,
            width: 105,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Sıradaki Sınav',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Container imageIcon() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.topLeft,
      child: Container(
        height: 50,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Image.asset(
            'assets/hat.png',
            width: 35,
          ),
        ),
      ),
    );
  }
}
