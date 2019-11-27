import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/splash/splash_screen.dart';

import 'helpers/navigator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      title: 'Smart Moodle',
      routes: appRoutes(),
    ));
