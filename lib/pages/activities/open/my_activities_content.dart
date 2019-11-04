import 'package:flutter/material.dart';

class MyActivitiesContentPage extends StatefulWidget {
  final Function onTap;

  const MyActivitiesContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyActivitiesContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Atividades"),
        leading: GestureDetector(onTap: widget.onTap, child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Minhas Atividades - Mostrar Atividades em Aberto"),
      ),
    );
  }
}
