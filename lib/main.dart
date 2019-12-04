import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/splash/splash_screen.dart';

import 'helpers/navigator.dart';

Widget app = MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  title: 'Smart Moodle',
  routes: appRoutes(),
);

void main() => runApp(app);