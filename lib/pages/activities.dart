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
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Carregando...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot doc) {
                  return new ListTile(
                    title: new Text(doc['name']),
                    subtitle: new Text('Tempo necessário: ${doc['time']} - Dificuldade: ${doc['difficult']} '),
                  );
                }).toList(),
              );
          }
        },
      )
    );
  }
}