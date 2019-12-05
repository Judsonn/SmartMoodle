import 'package:SmartMoodle/helpers/navigator.dart';
import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:flutter/material.dart';

class SimpleDrawer extends StatefulWidget {
  SimpleDrawer({Key key}) : super(key: key);

  @override
  _SimpleDrawerState createState() => _SimpleDrawerState();
}

class _SimpleDrawerState extends State<SimpleDrawer> {
  String username = 'Carregando...';
  String fullname = 'Carregando...';
  String avatar;

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>> _getUserData() async {
    List<String> values = await UserPreferences.getSession();
    if (values.isNotEmpty) {
      username = values[2];
      fullname = values[3];
      avatar = values[7];
      return [username, fullname, avatar];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder<List<String>>(
              future: _getUserData(),
              builder: (context, snapshot) {
                return UserAccountsDrawerHeader(
                  accountName: snapshot.data != null
                      ? Text(snapshot.data[0])
                      : Text("$username"),
                  accountEmail: snapshot.data != null
                      ? Text(snapshot.data[1])
                      : Text("$fullname"),
                  currentAccountPicture: ClipRect(
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.blue
                                : Colors.white,
                        child: avatar != null
                            ? Image.network(avatar)
                            : Text(_getInitialsName())),
                  ),
                );
              }),
          ..._listItems()
        ],
      ),
    );
  }

  String _getInitialsName() {
    List<String> separatedFullName = fullname.trim().split(" ");
    return separatedFullName.length > 0
        ? separatedFullName[0].substring(0, 1) +
            separatedFullName[separatedFullName.length - 1].substring(0, 1)
        : fullname.substring(0, 1);
  }

  List<Widget> _listItems() {
    return [
      _item('INÍCIO', 'home', Icons.home),
      _item('MINHAS ATIVIDADES', 'activities_actives', Icons.list),
      _item('ATIVIDADES REALIZADAS', 'activities_history',
          Icons.playlist_add_check),
      _item('MINHAS PROVAS', 'my_evaluations', Icons.bookmark),
      _item('MINHAS PROVAS REALIZADAS', 'evaluations_history',
          Icons.library_books),
      Divider(),
      _item('SAIR', 'logout', Icons.arrow_back),
    ];
  }

  ListTile _item(String text, String route, [IconData icon = Icons.grade]) {
    return ListTile(
      title: Row(children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('$text'),
        ),
      ]),
      onTap: () {
        Navigator.of(context).pop();
        navigateTo(context, route);
      },
    );
  }
}
