import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/responsive_widget.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/services/db_service.dart';
import 'package:ingilizceegitim/widgets/auth_button.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';
import 'package:ingilizceegitim/widgets/custom_textField.dart';
import 'package:ingilizceegitim/widgets/loading.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final DbService _db = DbService();

  String name = "";
  String surname = "";
  String username = "";
  String email = "";
  String password = "";
  String status = "Ortaokul";

  String error = "";
  bool loading = false;
  double sliderVal = 15;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : buildBodyWResponsiveWidget();
  }

  ResponsiveWidget buildBodyWResponsiveWidget() {
    return ResponsiveWidget(
      backgroundColor: Colors.white,
      appbar: CustomAppBar(
        title1: 'Hoşgeldiniz',
        title: 'Öğrenmeye Başlamak İçin Hesap Oluşturun',
      ),
      builder: (context, constrains) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                fieldsAndButton(context),
                SizedBox(height: 50),
                signIn(),
              ],
            ),
          ),
        );
      },
    );
  }

  Container fieldsAndButton(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            nameAndSurname(),
            SizedBox(height: 12),
            CustomTextField(
              obscure: false,
              label: 'Kullanıcı adın',
              validation: (val) => val.length < 2
                  ? "Kullanıcı adınız en az 2 karakter içermelidir!"
                  : null,
              onChange: (val) {
                setState(() {
                  return username = val;
                });
              },
            ),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.centerLeft,
              child: datePicker(context),
            ),
            SizedBox(height: 12),
            CustomTextField(
              obscure: false,
              label: 'E-posta',
              validation: (val) =>
                  val.isEmpty ? "Lütfen E-postanızı girin!" : null,
              onChange: (val) {
                setState(() {
                  return email = val;
                });
              },
            ),
            SizedBox(height: 12),
            CustomTextField(
              obscure: true,
              label: 'Şifre',
              validation: (val) => val.length < 6
                  ? "Şifreniz en az 6 karakter içermelidir!"
                  : null,
              onChange: (val) {
                setState(() {
                  return password = val;
                });
              },
            ),
            SizedBox(height: 12),
            educationStatusSlider(),
            SizedBox(height: 12),
            AuthButton(
              title: "Hesap Oluştur",
              onPress: () async {
                if (_formKey.currentState.validate()) {
                  Map<String, String> userInfoMap = {
                    "email": email,
                    "password": password,
                    "name": name,
                    "surname": surname,
                    "username": username,
                  };
                  setState(() => loading = true);
                  dynamic result = await _auth.signUpWithEmailAndPassword(
                    email,
                    password,
                  );
                  _db.uploadUserInfo(userInfoMap);
                  if (result == null) {
                    setState(() {
                      loading = false;
                      error = "Kayıt olunamadı";
                    });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  datePicker(BuildContext context) {
    DateTime _dateTime;
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime(2020),
        ).then(
          (date) {
            setState(() {
              _dateTime = date;
            });
          },
        );
      },
      child: Container(
        height: 55,
        width: 156,
        decoration: BoxDecoration(
          color: Color(0xffEE9090),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _dateTime == null ? 'Doğum Tarihini Seç' : _dateTime.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Container educationStatusSlider() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Eğitim Durumunuz Nedir?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Daireyi Sürükleyiniz!',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          SizedBox(height: 15),
          Slider(
            activeColor: Color(0xffBA3E48),
            inactiveColor: Color(0xffEE9090),
            value: sliderVal,
            divisions: 2,
            min: 0,
            max: 30,
            onChanged: (val) {
              setState(() {
                return sliderVal = val;
              });
            },
          ),
        ],
      ),
    );
  }

  Row nameAndSurname() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomTextField(
            obscure: false,
            label: 'Adın',
            validation: (val) =>
                val.length < 2 ? "adınız en az 2 karakter içermelidir!" : null,
            onChange: (val) {
              setState(() {
                return name = val;
              });
            },
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: CustomTextField(
            obscure: false,
            label: 'Soyadın',
            validation: (val) => val.length < 2
                ? "Soyadınız en az 2 karakter içermelidir!"
                : null,
            onChange: (val) {
              setState(() {
                return surname = val;
              });
            },
          ),
        )
      ],
    );
  }

  Container signIn() {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          widget.toggleView();
        },
        child: Text(
          'Hesabım Var',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
