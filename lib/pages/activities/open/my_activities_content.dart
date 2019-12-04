import 'package:flutter/material.dart';
import 'package:SmartMoodle/models/Activity.dart';

class MyActivitiesContentPage extends StatefulWidget {
  final Function onTap;

  const MyActivitiesContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<MyActivitiesContentPage> {

  ActivityProvider provider = new ActivityProvider();
  Activity acti = new Activity();

  getCount() async{
    int count = await provider.count();
    return count;
    // List<Map> list = await provider.getAllActivities();
    // int nu = list.length;
    // return nu;
  }

  getActivity(id) async {
    Activity ac = await provider.getActivity(id);
    return ac;
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
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: getCount(),
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              Activity ac = getActivity(index);
              // return Text(listDataTest[index].title);
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                          // color: listDataTest[index].color,
                        ),
                        height: 120,
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(ac.act_name,
                                  style: TextStyle(fontSize: 24)),
                              Divider(),
                              Text(
                                  "Tempo restante: " +
                                      ac.act_hours.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "Peso: " +
                                      ac.act_weight.toString() +
                                      "/Nota: ",
                                      // ac.act_score.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}

