import 'package:SmartMoodle/pages/home/home_page.dart';
import 'package:SmartMoodle/pages/login/login_page.dart';
import 'package:SmartMoodle/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void navigateTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

Future<dynamic> navigateAndClearTo(BuildContext context, String route) {
  return Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
}

void navigatePushReplacementNamed(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}

Map<String, WidgetBuilder> appRoutes() {
  return {
    "splash_screen": (context) => SplashScreen(),
    "login": (context) => LoginPage(),
    "home": (context) => HomePage()
  };
}
