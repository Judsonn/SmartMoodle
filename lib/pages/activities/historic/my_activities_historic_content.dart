import 'package:flutter/material.dart';

class MyActivitiesHistoricContentPage extends StatefulWidget {
  final Function onTap;

  const MyActivitiesHistoricContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyActivitiesHistoricContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividades Realizadas"),
        leading: GestureDetector(onTap: widget.onTap, child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Atividades Realizadas - Mostrar Histórico das Atividades"),
      ),
    );
  }
}
