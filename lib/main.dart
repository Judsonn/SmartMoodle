import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/login/login_page.dart';
import 'package:SmartMoodle/pages/splash/splash_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/ImageSplashScreen": (context) => SplashScreen(),
        "/login": (context) => LoginPage()
      },
    ));
