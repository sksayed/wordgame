import 'package:flutter/material.dart';
import 'package:wordgame/screens/auth/singUp.dart';
import 'package:wordgame/screens/home/screen_controller.dart';
import 'package:wordgame/widgets/auth_button.dart';
import 'package:wordgame/widgets/custom_appbar.dart';
import 'package:wordgame/widgets/custom_textField.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return buildBodyWResponsiveWidget();
  }

  Widget buildBodyWResponsiveWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title1: 'Welcome',
        title: 'Sign in to playing and learning with enjoying',
      ),
      body: Padding(
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
            'Forgot Password?',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Text(
              'Create New Account',
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
              label: 'Email',
              validation: (val) =>
                  val.isEmpty ? "Please fill email field" : null,
              onChange: (val) {
                setState(() {
                  return email = val;
                });
              },
            ),
            SizedBox(height: 12),
            CustomTextField(
              obscure: true,
              label: 'Password',
              validation: (val) =>
                  val.isEmpty ? "Please fill password field" : null,
              onChange: (val) {
                setState(() {
                  return password = val;
                });
              },
            ),
            SizedBox(height: 12),
            AuthButton(
              title: "Sign In",
              onPress: () async {
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenController(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
