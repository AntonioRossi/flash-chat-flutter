import 'package:flash_chat/components/wide_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                },
                style: TextStyle(color: Colors.black87),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                },
                obscureText: true,
                style: TextStyle(color: Colors.black87),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password')),
            SizedBox(
              height: 24.0,
            ),
            WideButton(
              text: 'Login',
              color: Colors.lightBlueAccent,
              callBack: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
