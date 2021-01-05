import 'package:flutter/material.dart';
import 'package:wordgame/screens/auth/signIn.dart';
import 'package:wordgame/widgets/custom_appbar.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  bool isSwitched = false;
  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;
  Setting({
    this.isSwitched,
    this.isSwitched1,
    this.isSwitched2,
    this.isSwitched3,
  });

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;

  @override
  Widget build(BuildContext context) {
    return buildResponsiveWidget();
  }

  Widget buildResponsiveWidget() {
    return Scaffold(
      appBar: CustomAppBarForSettings(
        title1: "Settings",
      ),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      child: Column(
        children: [
          buildFirstSettings(),
          SizedBox(height: 10),
          buildDivider(),
          SizedBox(height: 5),
          noficationsSwitcher(),
          SizedBox(height: 5),
          buildDivider(),
          SizedBox(height: 15),
          moreSwitcherSettings(),
          SizedBox(height: 20),
          signOutButton()
        ],
      ),
    );
  }

  Widget signOutButton() {
    return GestureDetector(
      onTap: () => buildShowDialog(context),
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Logout',
          style: TextStyle(
            color: Color(0xffBA3E48),
            decoration: TextDecoration.underline,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Container moreSwitcherSettings() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Music Effects',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Switch(
                value: isSwitched1,
                onChanged: (value) {
                  setState(() {
                    if (isSwitched1 == true) {
                      return isSwitched1 = false;
                    } else {
                      return isSwitched1 = true;
                    }
                  });
                },
                activeTrackColor: Color(0xffBA3E48),
                activeColor: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Play music after answer',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Switch(
                value: isSwitched2,
                onChanged: (value) {
                  setState(() {
                    if (isSwitched2 == true) {
                      return isSwitched2 = false;
                    } else {
                      return isSwitched2 = true;
                    }
                  });
                },
                activeTrackColor: Color(0xffBA3E48),
                activeColor: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Resume Song',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Switch(
                value: isSwitched3,
                onChanged: (value) {
                  setState(() {
                    if (isSwitched3 == true) {
                      return isSwitched3 = false;
                    } else {
                      return isSwitched3 = true;
                    }
                  });
                },
                activeTrackColor: Color(0xffBA3E48),
                activeColor: Colors.white,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'If Answer Is Correct, Continue Without Waiting',
              style: TextStyle(color: Colors.black38, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  Container noficationsSwitcher() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notifications',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                if (isSwitched == false) {
                  return isSwitched = true;
                } else {
                  return isSwitched = false;
                }
              });
            },
            activeTrackColor: Color(0xffBA3E48),
            activeColor: Colors.white,
          ),
        ],
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

  Divider buildDivider() {
    return Divider(
      height: 2,
      thickness: 2,
      indent: 25,
      endIndent: 25,
    );
  }

  buildFirstSettings() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Change Language',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Use Code',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feedback',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
