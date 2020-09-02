import 'package:flutter/material.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
import 'package:ingilizceegitim/widgets/auth_button.dart';
import 'package:ingilizceegitim/widgets/custom_appbar.dart';
import 'package:ingilizceegitim/widgets/custom_textField.dart';
import 'package:ingilizceegitim/widgets/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            appBar: CustomAppBar(
              title1: 'Hoşgeldiniz',
              title: 'Öğrenmeye Başlamak İçin Giriş Yapın',
            ),
            body: _buildBody(),
          );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fieldsAndButton(),
            signUpAndForgotPassword(),
          ],
        ),
      ),
    );
  }

  Container signUpAndForgotPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Şifremi Unuttum',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.toggleView();
            },
            child: Text(
              'Yeni Hesap Oluştur',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container fieldsAndButton() {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              obscure: false,
              label: 'E-posta',
              validation: (val) =>
                  val.isEmpty ? "Lütfen e-postanızı girin!" : null,
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
              validation: (val) =>
                  val.isEmpty ? "Lütfen şifrenizi girin!" : null,
              onChange: (val) {
                setState(() {
                  return password = val;
                });
              },
            ),
            SizedBox(height: 12),
            AuthButton(
              title: "Giriş Yap",
              onPress: () async {
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _auth.signInWithEmailAndPassword(
                    email,
                    password,
                  );
                  if (result == null) {
                    setState(() {
                      loading = false;
                      error = "E-posta ve ya Şifre yanlış";
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
}
