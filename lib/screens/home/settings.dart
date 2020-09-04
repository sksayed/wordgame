import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/responsive_widget.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';

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
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return buildResponsiveWidget();
  }

  ResponsiveWidget buildResponsiveWidget() {
    return ResponsiveWidget(
      appbar: CustomAppBarForSettings(
        title1: "Ayarlar",
      ),
      builder: (context, constrains) {
        return buildBody();
      },
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
          SizedBox(height: 10),
          signOutButton()
        ],
      ),
    );
  }

  Widget signOutButton() {
    return GestureDetector(
      onTap: () {
        buildShowDialog(context);
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Çıkış Yap',
          style: TextStyle(
            color: Color(0xffBA3E48),
            decoration: TextDecoration.underline,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Çıkış Yap"),
        content: new Text("Çıkış yapmak istediğine emin misin?"),
        actions: <Widget>[
          RaisedButton(
            color: Color(0xffEE9090),
            child: Text('Hayır'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            color: Color(0xffBA3E48),
            child: Text('Evet'),
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pop();
            },
          )
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
                value: widget.isSwitched1,
                onChanged: (value) {
                  setState(() {
                    if (widget.isSwitched1 == true) {
                      return widget.isSwitched1 = false;
                    } else {
                      return widget.isSwitched1 = true;
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
                value: widget.isSwitched2,
                onChanged: (value) {
                  setState(() {
                    if (widget.isSwitched2 == true) {
                      return widget.isSwitched2 = false;
                    } else {
                      return widget.isSwitched2 = true;
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
                value: widget.isSwitched3,
                onChanged: (value) {
                  setState(() {
                    if (widget.isSwitched3 == true) {
                      return widget.isSwitched3 = false;
                    } else {
                      return widget.isSwitched3 = true;
                    }
                  });
                },
                activeTrackColor: Color(0xffBA3E48),
                activeColor: Colors.white,
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Verilen Cevap Eğer Doğruysa Beklemeden Devam Et',
              style: TextStyle(color: Colors.black38, fontSize: 13),
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
            'Bildirimler',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Switch(
            value: widget.isSwitched,
            onChanged: (value) {
              setState(() {
                if (widget.isSwitched == false) {
                  return widget.isSwitched = true;
                } else {
                  return widget.isSwitched = false;
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
