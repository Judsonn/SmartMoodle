
import 'package:flutter/material.dart';

import 'package:SmartMoodle/models/Activity.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:SmartMoodle/pages/activities/open/my_activities_page.dart';

Future<String> pathtodb = getDatabasesPath();

class NewActivityContentPage extends StatefulWidget {
  final Function onTap;
  const NewActivityContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<NewActivityContentPage> {
  num _currentDifficultValue = 50;
  num _currentWeightValue = 5.0;
  num _currentKnowledgeValue = 50;
  num _currentHoursValue = 50;
  
  NumberPicker difficultNumberPicker;
  NumberPicker weightNumberPicker;
  NumberPicker knowledgeNumberPicker;
  NumberPicker hoursNumberPicker;
  

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  ActivityProvider provider = new ActivityProvider();
  

  String pathcompleted = join(pathtodb.toString(), 'smartmoodle.db');
  Activity acti = new Activity();

BuildContext aux;

  
  @override
  Widget build(BuildContext context) {
    aux = context;
    _initializeNumberPickers();
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
                    icon: Icon(Icons.menu, size: 30, color: Colors.grey),
                    onPressed: widget.onTap,
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
        body: CustomScrollView(
            
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Form(
                  key: this._formKey,
                  autovalidate: _autoValidate,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Informe o nome da atividade:',
                            style: Theme.of(context).textTheme.title),
                        TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Por favor, de um nome para a atividade';
                            }
                            return null;
                          },
                          
                          onChanged: (String value) => acti.act_name = value,
                        ),



                        Divider(color: Colors.grey, height: 32),

                        Text('Qual a DIFICULDADE da atividade?',
                            style: Theme.of(context).textTheme.title),
                        difficultNumberPicker,

                        Divider(color: Colors.grey, height: 32),

                        Text('Qual o PESO da atividade na média final?',
                            style: Theme.of(context).textTheme.title),
                        weightNumberPicker,

                        Divider(color: Colors.grey, height: 32),

                        Text('Qual o seu CONHECIMENTO sobre o assunto?',
                            style: Theme.of(context).textTheme.title),
                        knowledgeNumberPicker,

                        Divider(color: Colors.grey, height: 32),

                        Text('Quantas HORAS até a entrega da atividade?',
                            style: Theme.of(context).textTheme.title),
                        hoursNumberPicker,

                        Divider(color: Colors.grey, height: 32),
                        

                        RaisedButton(
                          child: Text('Criar'),
                          onPressed: _validateInputs,
                        ),
                        SizedBox(height: 50.0),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ]));
  }

  void _validateInputs() {
    final form = this._formKey.currentState;
    if (form.validate()) {
      setState(() {
        acti.act_difficulty = _currentDifficultValue;
        acti.act_weight = _currentWeightValue;
        acti.act_knowledge = _currentKnowledgeValue;
        acti.act_hours = _currentHoursValue;
        provider.insert(acti);
        form.save();
         Navigator.pushReplacement(
          aux,
          MaterialPageRoute(builder: (context) => MyActivitiesPage()),
        );
      });
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void _initializeNumberPickers() {
    difficultNumberPicker = new NumberPicker.horizontal(
      initialValue: _currentDifficultValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      zeroPad: true,
      onChanged: (value) => setState(() => _currentDifficultValue = value),
    );
    
    knowledgeNumberPicker = new NumberPicker.horizontal(
      initialValue: _currentKnowledgeValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      zeroPad: true,
      onChanged: (value) => setState(() => _currentDifficultValue = value),
    );
    hoursNumberPicker = new NumberPicker.horizontal(
      initialValue: _currentHoursValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      zeroPad: true,
      onChanged: (value) => setState(() => _currentHoursValue = value),
    );
    weightNumberPicker = new NumberPicker.decimal(
      initialValue: _currentWeightValue,
      minValue: 1,
      maxValue: 10,
      decimalPlaces: 2,
      onChanged: (value) => setState(() => _currentWeightValue = value),
    );
  }
}
