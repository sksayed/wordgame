import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/responsive_widget.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';
import 'package:ingilizceegitim/widgets/ranking_card.dart';

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
    return ResponsiveWidget(
      appbar: appbar(),
      builder: (context, constrains) {
        return buildBody();
      },
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 20),
          gunlukHaftalikAylik(),
          SizedBox(height: 50),
          users()
        ],
      ),
    );
  }

  Container users() {
    return Container(
      child: Column(
        children: [
          RankingCard(
            number: '1',
            username: 'Kullanıcı',
            score: '6920',
            image: 'assets/gold.png',
          ),
          RankingCard(
            number: '2',
            username: 'Kullanıcı',
            score: '5682',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '3',
            username: 'Kullanıcı',
            score: '4589',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '4',
            username: 'Kullanıcı',
            score: '4356',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '5',
            username: 'Kullanıcı',
            score: '3675',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '6',
            username: 'Kullanıcı',
            score: '3523',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '7',
            username: 'Kullanıcı',
            score: '3244',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '8',
            username: 'Kullanıcı',
            score: '2896',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '9',
            username: 'Kullanıcı',
            score: '2594',
            image: 'assets/nothing.png',
          ),
          RankingCard(
            number: '10',
            username: 'Kullanıcı',
            score: '2203',
            image: 'assets/nothing.png',
          ),
        ],
      ),
    );
  }

  Padding gunlukHaftalikAylik() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
