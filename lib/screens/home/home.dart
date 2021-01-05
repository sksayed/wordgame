import 'package:flutter/material.dart';
import 'package:wordgame/screens/auth/signIn.dart';
import 'package:wordgame/widgets/custom_appbar.dart';
import 'package:wordgame/widgets/lesson_card.dart';
import 'package:wordgame/widgets/settings_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var colorListForLessonCards = <Color>[
    Color(0xff1FBB8B),
    Color(0xff165567),
    Color(0xffC17F3E),
    Color(0xffCFC060),
    Color(0xff1FBB8B),
    Color(0xff165567),
    Color(0xff165567),
    Color(0xffCFC060),
    Color(0xff1FBB8B),
    Color(0xffC17F3E),
  ];
  var titleListForLessonCards = <String>[
    "Jobs",
    "Development",
    "Health",
    "Coocking",
    "Python/Dev",
    "Flutter/Dev",
    "History",
    "Literature",
    "Math",
    "Enginnering",
  ];
  @override
  Widget build(BuildContext context) {
    return buildResponsiveWidget(context);
  }

  Widget buildResponsiveWidget(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: buildSettingsDrawer(context),
      appBar: CustomAppBarForHome(
        title1: 'Word Game',
        onPress: () => _scaffoldKey.currentState.openEndDrawer(),
      ),
      body: buildBody(),
    );
  }

  SettingsDrawer buildSettingsDrawer(BuildContext context) {
    return SettingsDrawer(
      logoutButton: () {
        Navigator.of(context).pop();
        buildShowDialog(context);
      },
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            searchField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: lessonCardList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget lessonCardList() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: colorListForLessonCards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3),
          child: LessonCard(
            color: colorListForLessonCards[index],
            title: titleListForLessonCards[index],
          ),
        );
      },
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Game",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.mic,
                color: Color(0xffBA3E48),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Logut"),
        content: new Text("Are you sure wanna to logut"),
        actions: <Widget>[
          RaisedButton(
            color: Color(0xffEE9090),
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            color: Color(0xffBA3E48),
            child: Text('Yes'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
