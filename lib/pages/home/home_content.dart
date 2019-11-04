import 'package:flutter/material.dart';

class HomeContentPage extends StatefulWidget {

  final Function onTap;

  const HomeContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<HomeContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ínicio"),
        leading: GestureDetector(
            onTap: widget.onTap,
            child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Tela Inicial - Sem conteúdo ainda"),
      ),
    );
  }
}


