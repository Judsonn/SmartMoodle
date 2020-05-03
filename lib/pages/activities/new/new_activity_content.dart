import 'package:SmartMoodle/pages/widgets/button_custom.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

import 'package:SmartMoodle/models/Activity.dart';
import 'package:path/path.dart';

Future<String> pathtodb = getDatabasesPath();

class NewActivityContentPage extends StatefulWidget {
  final Function onTap;
  const NewActivityContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<NewActivityContentPage> {

  final _formKey = GlobalKey<FormState>();

  ActivityProvider provider = new ActivityProvider();
  

  String pathcompleted = join(pathtodb.toString(), 'smartmoodle.db');
  Activity acti = new Activity();

BuildContext aux;

  
  @override
  Widget build(BuildContext context) {
    aux = context;
    provider.open(pathcompleted);
    // Build a Form widget using the _formKey created above.
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
              Text("Nova Atividade",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Informe o nome da atividade:'),
                  TextFormField(
                    autovalidate: false,
                    onSaved: (name) => acti.act_name = name,
                    validator: (name) {
                      if (name.length < 5) {
                        return 'Nome deve ter mais de 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  Text('Qual a DIFICULDADE da atividade?'),
                  new TextFormField(
                    decoration:
                        new InputDecoration(labelText: "Porcentagem (0 - 100)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSaved: (difficulty) => acti.act_difficulty = difficulty as num,
                  ),

                  Text('Qual o PESO da atividade na média final?'),
                  new TextFormField(
                    decoration:
                        new InputDecoration(labelText: "Peso (0 - 10)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSaved: (weight) => acti.act_weight = weight as num,
                  ),

                  Text('Qual o seu CONHECIMENTO sobre o assunto?'),
                  new TextFormField(
                    decoration:
                        new InputDecoration(labelText: "Porcentagem (0 - 100)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSaved: (knowleage) => acti.act_knowledge = knowleage as num,
                  ),

                  Text('Quantas HORAS até a entrega da atividade?'),
                  new TextFormField(
                    decoration:
                        new InputDecoration(labelText: "Número de horas"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    onSaved: (hours) => acti.act_hours = hours as num,
                  ),

                  SizedBox(height: 50.0),

                  ButtonCustom(
                    title: "Salvar",
                    iconData: Icons.save,
                    reverseColor: true,
                    onPressed: () {
                      if (this._formKey.currentState.validate()) {
                        setState(() {
                          this._formKey.currentState.save();
                        });
                      }
                    },
                  ),

                  SizedBox(height: 50.0),
                  // Text('${this._name} is ${this._age} years old')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
