import 'package:flutter/material.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';

class RankingScreen extends StatelessWidget {
  appbar() {
    return CustomAppBarForRankingScreen(
      title1: "Liderlik Tablosu",
      title2: "Sıralaman. Toplam Puanın",
      score1: '13',
      score2: '1250',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        SizedBox(height: 20),
        gunlukHaftalikAylik(),
        SizedBox(height: 20),
        
      ],
    );
  }

  Padding gunlukHaftalikAylik() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Günlük',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 3,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffBA3E48),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 50),
          Container(
            child: Column(
              children: [
                Text(
                  'Haftalık',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 50),
          Container(
            child: Column(
              children: [
                Text(
                  'Aylık',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
