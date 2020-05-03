import 'package:SmartMoodle/helpers/navigator.dart';
import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:SmartMoodle/pages/activities/historic/my_activities_historic_page.dart';
import 'package:SmartMoodle/pages/activities/open/my_activities_page.dart';
import 'package:SmartMoodle/pages/evaluations/historic/my_evaluations_historic_page.dart';
import 'package:SmartMoodle/pages/evaluations/open/my_evaluations_page.dart';
import 'package:SmartMoodle/pages/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/home/home_content.dart';
import 'package:SmartMoodle/pages/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'unknown';
  String fullname = 'unknown';
  String avatar;

  @override
  void initState() { 
    super.initState();
    UserPreferences.getSession().then((userInformation){
      print(userInformation);
      if (userInformation.isNotEmpty) {
        username = userInformation[4];
        fullname = userInformation[3];
        avatar = userInformation[7];
      } 
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff75dde8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: size.height * 0.30,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.black38,
                  blurRadius: 10
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      _avatar(avatar, username, fullname),
                      SizedBox(height: 10),
                      Text("Seja bem vindo", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey
                      )),
                      SizedBox(height: 10),
                      Text(fullname, style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey
                      ), textAlign: TextAlign.center)
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(icon: Icon(Icons.exit_to_app, color: Colors.grey,), onPressed: () async {
                      await UserPreferences.destroySession();
                      navigateAndClearTo(context, 'splash_screen');
                    }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 70),
                  ButtonCustom(
                    title: "Minhas Atividades",
                    iconData: Icons.content_copy,
                    onPressed:() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyActivitiesPage()),
                    ),
                  ),
                  ButtonCustom(
                    title: "Atividades Realizadas",
                    iconData: Icons.check_box,
                    onPressed:() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyActivitiesHistoricPage()),
                    ),
                  ),
                  ButtonCustom(
                    title: "Minhas Provas",
                    iconData: Icons.edit,
                    onPressed:() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyEvaluationsPage()),
                    ),
                  ),
                  ButtonCustom(
                    title: "Provas Realizadas",
                    iconData: Icons.check_box,
                    onPressed:() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyEvaluationsHistoricPage()),
                    ),
                  ),
                  SizedBox(height: 70)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

   Widget _avatar(String avatar, String username, String fullname) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: avatar != null ? Image.network(avatar, fit: BoxFit.cover,) : Text(_getInitialsName(fullname))
        ),
      ),
    );
  }

   String _getInitialsName(String fullname){
    List<String> separatedFullName = fullname.trim().split(" ");
    print(separatedFullName);
    return separatedFullName.length > 0 
          ? separatedFullName[0].substring(0,1) + separatedFullName[separatedFullName.length - 1].substring(0,1) 
          : fullname.substring(0, 1);
  }
}
