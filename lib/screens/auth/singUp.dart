import 'package:flutter/material.dart';
import 'package:ingilizceegitim/services/auth_services.dart';
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

  String name = "";
  String surname = "";
  String username = "";
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
              title: 'Öğrenmeye Başlamak İçin Hesap Oluşturun',
            ),
            body: _buildBody(),
          );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: [
            fieldsAndButton(),
            SizedBox(height: 100),
            signIn(),
          ],
        ),
      ),
    );
  }

  Container fieldsAndButton() {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 12),
            CustomTextField(
              obscure: false,
              label: 'Kullanıcı adın',
              fillColor: Colors.red[200],
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
            CustomTextField(
              obscure: false,
              label: 'E-posta',
              fillColor: Colors.red[200],
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
              fillColor: Colors.red[200],
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
            AuthButton(
              title: "Hesap Oluştur",
              onPress: () async {
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _auth.signUpWithEmailAndPassword(
                    email,
                    password,
                  );
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

  Container signIn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
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
