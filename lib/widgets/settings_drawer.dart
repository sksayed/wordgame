import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  final Function logoutButton;
  SettingsDrawer({this.logoutButton});
  @override
  SettingsDrawerState createState() => SettingsDrawerState();
}

class SettingsDrawerState extends State<SettingsDrawer> {
  final Function logoutButton;
  SettingsDrawerState({this.logoutButton});
  bool isSwitched = false;
  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 10,
        ),
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30),
          buildFirstSettings(),
          SizedBox(height: 10),
          buildDivider(),
          SizedBox(height: 5),
          noficationsSwitcher(),
          SizedBox(height: 5),
          buildDivider(), 
          SizedBox(height: 15),
          moreSwitcherSettings(),
          SizedBox(height: 10),
          signOutButton()
        ],
      ),
    );
  }

  Widget signOutButton() {
    return GestureDetector(
      onTap: () {
        widget.logoutButton();
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Logout',
          style: TextStyle(
              color: Color(0xffBA3E48),
              decoration: TextDecoration.underline,
              fontSize: 15),
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
          Text(
            'If Answer Is Correct, Continue Without Waiting',
            style: TextStyle(color: Colors.black38, fontSize: 13),
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
