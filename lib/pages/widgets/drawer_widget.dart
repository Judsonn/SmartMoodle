import 'package:SmartMoodle/helpers/navigator.dart';
import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/activities/historic/my_activities_historic_page.dart';
import 'package:SmartMoodle/pages/activities/open/my_activities_page.dart';
import 'package:SmartMoodle/pages/evaluations/historic/my_evaluations_historic_page.dart';
import 'package:SmartMoodle/pages/evaluations/open/my_evaluations_page.dart';
import 'package:SmartMoodle/pages/home/home_page.dart';

class DrawerWidget extends StatefulWidget {
  final int menuSelecionado;
  final String username = '1701570592';
  final String fullname = 'GUSTAVO BITTENCOURT SATHELER';

  DrawerWidget(this.menuSelecionado);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int itemSelect = 0;

  //cria o avatar com nome, email e imagem
  Widget _avatar() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Text('GG'),
          ),
          Container(
            height: 12.0,
          ),
          Text(
            widget.username,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text(widget.fullname),
        ],
      ),
    );
  }

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _avatar(),
        _tiles("INÍCIO", Icons.home, 0, () {
          updateMenu(0);
          setState(() {
            itemSelect = 0;
          });
          dash(context);
        }),
        _tiles("MINHAS ATIVIDADES", Icons.view_list, 1, () {
          updateMenu(1);
          setState(() {
            itemSelect = 1;
          });
          dash(context);
        }),
        _tiles("ATIVIDADES REALIZADAS", Icons.history, 2, () {
          updateMenu(2);
          dash(context);
        }),
        _tiles("MINHAS PROVAS", Icons.event, 3, () {
          updateMenu(3);
          dash(context);
        }),
        _tiles("PROVAS REALIZADAS", Icons.history, 4, () {
          updateMenu(4);
          dash(context);
        }),
        Divider(),
        _tiles("SAIR", Icons.arrow_back, 3, () {
          UserPreferences.destroySession();
          navigateAndClearTo(context, 'splash_screen');
        }),
      ],
    );
  }

  updateMenu(int index) {
    setState(() {
      itemSelect = index;
    });
  }

  void dash(BuildContext context) {
    switch (itemSelect) {
      case 0:
        print('Selecionou Inicio');
        //return HomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        print('Selecionou Minhas Atividades');
        //return HomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyActivitiesPage()),
        );
        break;
      case 2:
        print('Selecionou Atividades Realizadas');
        //return HomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyActivitiesHistoricPage()),
        );
        break;
      case 3:
        print('Selecionou Minhas Provas');
        //return HomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyEvaluationsPage()),
        );
        break;
      case 4:
        print('Selecionou Provas Realizadas');
        //return HomePage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyEvaluationsHistoricPage()),
        );
        break;
      default:
        print('Ocorreu um erro!');
    }
  }

  //cria cada item do menu
  //@todo personalizar a decoração de cores do menu, quando selecionado
  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      onTap: onTap,
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          //color: Colors.amber,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xff01A0C7)],
            ),
          ),
          child: _listMenu()),
    );
  }
}
