import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/splash/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'helpers/navigator.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Widget app = MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  title: 'Smart Moodle',
  routes: appRoutes(),
);

void main() {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  runApp(app);
}
