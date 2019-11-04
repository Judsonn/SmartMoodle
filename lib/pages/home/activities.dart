import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('activities').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Carregando...');
            default:
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot doc) {
                      String _name = doc['name'];
                      String _time = doc['time'];
                      int _difficult = doc['difficult'];

                  return ListTile(
                    title: Text(_name),
                    subtitle: Text('Tempo necessário: $_time | Dificuldade: $_difficult '),
                  );
                }).toList(),
              );
          }
        },
      )
    );
  }
}