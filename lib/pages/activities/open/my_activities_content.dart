import 'package:SmartMoodle/helpers/utils.dart';
import 'package:SmartMoodle/models/DatabaseActivityModel.dart';
import 'package:SmartMoodle/models/UserActivities.dart' as mod;
import 'package:SmartMoodle/services/database.dart';
import 'package:SmartMoodle/services/mobx/my_activities_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyActivitiesContentPage extends StatefulWidget {
  final Function onTap;

  const MyActivitiesContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyActivitiesContentPage> {
  MyActivities _myActivitiesBase;
  List<DataBaseActitivyModel> _dataBaseActitivyModel = [];
  int _radioValue = -1;

  @override
  void initState() {
    _myActivitiesBase = MyActivities();
    DatabaseServices.db.getAllActivities().then((onValue) {
      if (onValue != null && onValue.isNotEmpty) {
        _dataBaseActitivyModel = onValue;
        print(_dataBaseActitivyModel.toString());
      }
    });

var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    super.initState();
    _myActivitiesBase.getUserAtivities();
  }

  @override
  void dispose() {
    _myActivitiesBase.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff75dde8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black26, spreadRadius: 5)
              ]),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.menu, size: 30, color: Colors.grey),
                  onPressed: widget.onTap,
                ),
              ),
              Text("Minhas Atividades",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _myActivitiesBase.getUserAtivities();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Observer(builder: (ctx) {
              if (_myActivitiesBase.userActivities == null) {
                return CircularProgressIndicator();
              } else {
                List<mod.Events> events =
                    _myActivitiesBase.userActivities.events;
                return ListView.builder(
                    itemCount: events.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) {
                      mod.Events current = events[index];
                      DataBaseActitivyModel data = DataBaseActitivyModel(
                        title: events[index].name,
                        coursename: events[index].course.fullname,
                        timestart: events[index].timestart,
                      );
                      // return Text(listDataTest[index].title);
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Alert(
                                title:
                                    "Em sua perspectiva, qual o nível de dificuldade dessa atividade em sua?",
                                content: StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                  return Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ListTile(
                                          leading: Radio(
                                            value: 1,
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue = value;
                                                print(_radioValue);
                                              });
                                            },
                                          ),
                                          title: Text("Baixa"),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ListTile(
                                          leading: Radio(
                                            value: 2,
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue = value;
                                                print(_radioValue);
                                              });
                                            },
                                          ),
                                          title: Text("Média"),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ListTile(
                                          leading: Radio(
                                            value: 3,
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue = value;
                                                print(_radioValue);
                                              });
                                            },
                                          ),
                                          title: Text("Alta"),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                context: context,
                                closeFunction: () {},
                                buttons: [
                                  DialogButton(
                                    child: Text("Confirmar",
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () async {
                                      await _myActivitiesBase.setSaveLocalData(
                                          data);
                                      await _myActivitiesBase
                                          .getUserAtivities();
                                      await _myActivitiesBase.scheduleNotification(data.title);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]).show();
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      color: Colors.grey
                                      // color: _dataBaseActitivyModel.isEmpty
                                      //     ? Colors.grey
                                      //     : _getColorByPriority(
                                      //         _dataBaseActitivyModel[index].priority),
                                    ),
                                    height: 200,
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(current.name,
                                              style: TextStyle(fontSize: 24)),
                                          Divider(),
                                          Text(current.course.fullnamedisplay),
                                          Divider(),
                                          Text(
                                              "Data de entrega: " +
                                                  getDateFormatByUnix(
                                                      current.timestart,
                                                      "dd/MM/yyyy kk:mm:ss"),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              )),
                                          Text("Peso: 0.5/Nota: 10",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    });
              }
            }),
          ),
        ),
      ),
    );
  }

    Future<void> onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              print('notification_pressed');

            },
          )
        ],
      ),
    );
  }

  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  _getColorByPriority(int priority) {
    switch (priority) {
      case 1:
        return Colors.orange;
        break;
      case 2:
        return Colors.yellow[600];
        break;
      case 3:
        return Colors.red[600];
        break;
      default:
        return Colors.grey;
    }
  }
}
