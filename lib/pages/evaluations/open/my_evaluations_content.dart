import 'package:flutter/material.dart';

class MyEvaluationsContentPage extends StatefulWidget {
  final Function onTap;

  const MyEvaluationsContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyEvaluationsContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Provas"),
        leading: GestureDetector(onTap: widget.onTap, child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Tela Provas - Mostrar provas em aberto"),
      ),
    );
  }
}
