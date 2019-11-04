import 'package:flutter/material.dart';

class MyEvaluationsHistoricContentPage extends StatefulWidget {
  final Function onTap;

  const MyEvaluationsHistoricContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyEvaluationsHistoricContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provas Realizadas"),
        leading: GestureDetector(onTap: widget.onTap, child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Tela Provas - Mostrar provas já realizadas"),
      ),
    );
  }
}
