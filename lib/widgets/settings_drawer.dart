import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  SettingsDrawerState createState() => SettingsDrawerState();
}

class SettingsDrawerState extends State<SettingsDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwitched = false;
  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(
          top: 80,
          left: 20,
          right: 10,
        ),
        children: [
          Text(
            'Ayarlar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40),
          buildFirstSettings(),
          SizedBox(height: 15),
          buildDivider(),
          SizedBox(height: 5),
          noficationsSwitcher(),
          SizedBox(height: 5),
          buildDivider(),
          SizedBox(height: 15),
          moreSwitcherSettings(),
          SizedBox(height: 15),
          
        ],
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
                    'Ses Efektleri',
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
                    'Cevaptan Sonra Sesi Çal',
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
                    'Hemen Devam Et',
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
              Text(
                'Verilen Cevap Eğer Doğruysa Beklemeden Devam Et',
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
            'Bildirimler',
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
                'Profil',
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
                'Kod Kullan',
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
                'Geri Bildirim',
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
