import 'dart:async';
import 'package:SmartMoodle/helpers/navigator.dart';
import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000), () async {
      List<String> session = await UserPreferences.getSession();
      String route = session.isEmpty ? 'login' : 'home';
      navigatePushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff01A0C7),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            //criar o degrade das cores do prototipo
            height: size.height,
            width: size.width,
            color: Color(0xff01A0C7),
          ),
          SizedBox(
              width: size.width / 2,
              child: Image.asset('assets/imgs/smart_logo.png')),
        ],
      ),
    );
  }
}
