import 'package:SmartMoodle/helpers/utils.dart';
import 'package:SmartMoodle/models/UserActivities.dart' as mod;
import 'package:SmartMoodle/services/mobx/my_activities_base.dart';
import 'package:flutter/material.dart';
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
  int _radioValue = -1;

  @override
  void initState() {
    _myActivitiesBase = MyActivities();
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
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
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

                if (events.isEmpty){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.content_copy, size: 60, color: Colors.white,),
                        SizedBox(height: 30),
                        Text("Nenhuma atividade encontrada", style: TextStyle(
                          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold
                        ), textAlign: TextAlign.center,),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: events.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) {
                      mod.Events current = events[index];
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
                                    onPressed: () {},
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
                                      color: Colors.green,
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
}
