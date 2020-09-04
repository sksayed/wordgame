import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final String number;
  final String username;
  final String score;
  final String image;
  RankingCard({
    this.number,
    this.username,
    this.score,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          divader(),
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRankingNumber(),
              buildRankingUsername(),
              buildRankingScore(),
            ],
          ),
          SizedBox(height: 13),
        ],
      ),
    );
  }

  Container divader() {
    return Container(
      height: 0.5,
      color: Colors.grey[600],
    );
  }

  Container buildRankingScore() {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Color(0xffBA3E48),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          score,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Container buildRankingUsername() {
    return Container(
      child: Text(
        username,
        style: TextStyle(
          fontSize: 16.5,
          fontWeight: FontWeight.w600,
          color: Color(0xff570108),
        ),
      ),
    );
  }

  Row buildRankingNumber() {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Color(0xff570108),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
