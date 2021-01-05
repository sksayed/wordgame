import 'package:flutter/material.dart';
import 'package:wordgame/widgets/custom_appbar.dart';
import 'package:wordgame/widgets/ranking_card.dart';

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Column(children: rankingCardList),
        ],
      ),
    );
  }

  Widget containerZad() {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgList[index])),)
    );
  }

  appbar() {
    return CustomAppBarForRankingScreen(
      title1: "Leaderboard",
      title2: "Your Total Ranking/Score",
      score1: '1',
      score2: '1250',
    );
  }
}

var rankingCardList = <RankingCard>[
  RankingCard(
    number: '1',
    username: 'theiskaa',
    score: '6920',
    image: 'assets/gold.png',
  ),
  RankingCard(
    number: '2',
    username: 'charless',
    score: '5682',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '3',
    username: 'keinshah22',
    score: '4589',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '4',
    username: 'user12332',
    score: '4356',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '5',
    username: 'user8493',
    score: '3675',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '6',
    username: 'user5434',
    score: '3523',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '7',
    username: 'user63463',
    score: '3244',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '8',
    username: 'user99888',
    score: '2896',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '9',
    username: 'user32323',
    score: '2594',
    image: 'assets/nothing.png',
  ),
  RankingCard(
    number: '10',
    username: 'user12214',
    score: '2203',
    image: 'assets/nothing.png',
  ),
];
