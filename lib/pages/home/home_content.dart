import 'package:SmartMoodle/pages/activities/new/new_activity_page.dart';
import 'package:SmartMoodle/pages/widgets/simple_drawer.dart';
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
        title: Text("Página Inicial"),
        // leading: GestureDetector(onTap: widget.onTap, child: Icon(Icons.menu)),
      ),
      drawer: SimpleDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              color: Colors.red,
              icon: Icon(Icons.add_circle), //`Icon` to display
              label: Text('Add Atividade'), //`Text` to display
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NewActivityPage()),
                );
              },
            ),
            FlatButton.icon(
              color: Colors.lightGreen,
              icon: Icon(Icons.add_circle), //`Icon` to display
              label: Text('Add Prova'), //`Text` to display
              onPressed: () {
                //Code to execute when Floating Action Button is clicked
                //...
              },
            ),
          ],
        ),
      ),
    );
  }
}
