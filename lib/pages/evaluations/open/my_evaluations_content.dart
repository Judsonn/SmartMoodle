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
      backgroundColor: Color(0xff75dde8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
                spreadRadius: 5
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Text("Minhas Provas", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: listDataTest.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index){
            // return Text(listDataTest[index].title);
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                )
              ),
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
                      color: listDataTest[index].color,
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
                          Text(listDataTest[index].title, style: TextStyle(fontSize: 24)),
                          Divider(),
                          Text("Tempo restante: " + listDataTest[index].timeLeft, style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                          Text("Peso: " + listDataTest[index].weight.toString() + "/Nota: " + listDataTest[index].evaluation.toString(), style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
                ],
              )
            );
          },
        ),
      )
    );
  }
}


List<DataTest> listDataTest = [
  DataTest(title: "Cálculo-1", timeLeft: "3 dias 4 horas", weight: 10, evaluation: 10, color: Colors.green),
  DataTest(title: "Programação Web", timeLeft: "2 dias 1 hora", weight: 10, evaluation: 9, color: Colors.red),
  DataTest(title: "Algoritmos", timeLeft: "8 horas", weight: 10, evaluation: 10, color: Colors.yellow),
  DataTest(title: "Lógica Matemática", timeLeft: "8 horas", weight: 10, evaluation: 10, color: Colors.grey),
];

class DataTest {
  final String title;
  final String timeLeft;
  final int weight;
  final double evaluation;
  final Color color;

  DataTest({this.title, this.timeLeft, this.weight, this.evaluation, this.color});
}