import 'package:SmartMoodle/helpers/navigator.dart';
import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:SmartMoodle/services/moodle.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Map<String, dynamic> state = {'student_code': '', 'password': ''};

  void login() async {
    String studentCode = state['student_code'];
    String password = state['password'];

    Map<String, dynamic> loginData =
        await MoodleAPI().login(studentCode, password);
    if (loginData.containsKey('token')) {
      String token = loginData['token'];
      String privateToken = loginData['privatetoken'];

      Map<String, dynamic> userData = await MoodleAPI().userData(token);
      List<String> userInformations = [
        userData['username'],
        userData['fullname'],
        userData['firstname'],
        userData['lastname'],
        userData['userid'].toString(),
        userData['userpictureurl'],
      ];

      UserPreferences.createSession(token, privateToken, userInformations);
      await navigateAndClearTo(context, 'home');
      return;
    }

    Alert(
        context: context,
        type: AlertType.error,
        title: loginData['error'],
        buttons: [
          DialogButton(
            child: Text(
              "FECHAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            radius: BorderRadius.circular(0.0),
          ),
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    //matricula
    final registrationField = TextField(
      obscureText: false,
      style: style,
      onChanged: (String value) {
        state['student_code'] = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Matrícula",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    //senha
    final passwordField = TextField(
      obscureText: true,
      onChanged: (String value) {
        state['password'] = value;
        print(state);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    //botão de login
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => login(),
        child: Text("ENTRAR",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: size.height,
          width: size.width,
//          color: Colors.white,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xff01A0C7)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 195.0,
                  child: Image.asset(
                    "assets/imgs/smart_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 40.0),
                registrationField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
