import 'package:flutter/material.dart';
import 'package:wordgame/screens/auth/signIn.dart';
import 'package:wordgame/screens/home/screen_controller.dart';
import 'package:wordgame/widgets/auth_button.dart';
import 'package:wordgame/widgets/custom_appbar.dart';
import 'package:wordgame/widgets/custom_textField.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

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
    return buildBodyWResponsiveWidget();
  }

  Widget buildBodyWResponsiveWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title1: 'Welcome',
        title: 'Sign up to playing and learning with enjoying',
      ),
      body: SingleChildScrollView(
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
      ),
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
              label: 'Username',
              validation: (val) => val.length < 2
                  ? "Username must to provide min 2 chars"
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
              label: 'Email',
              validation: (val) => val.isEmpty ? "Please enter email" : null,
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
                  val.length < 6 ? "Password must to provide min 6 char" : null,
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
              title: "Create Account",
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

  Container educationStatusSlider() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'What is Your Education Status',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Drag the Circle!',
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
            label: 'Name',
            validation: (val) =>
                val.length < 2 ? "Name must to provide 2 char" : null,
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
            label: 'Last Name',
            validation: (val) =>
                val.length < 2 ? "Last Name must to provide 2 char" : null,
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        },
        child: Text(
          'I already have account - Sign In',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
