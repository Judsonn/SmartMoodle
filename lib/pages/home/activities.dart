import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Atividades'),
      ),
      body: Text('REMOVIDO FIREBASE')
    );
  }
}