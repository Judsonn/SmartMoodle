import 'package:flutter/material.dart';

class NewActivityContentPage extends StatefulWidget {
  final Function onTap;

  const NewActivityContentPage({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int value;

  @override
  void initState() {
    super.initState();
    this.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              this.value--;
            });
          },
        ),
        Text(this.value.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this.value++;
            });
          },
        ),
      ],
    );
  }
}

// class CounterFormField extends FormField<int> {

//   CounterFormField({
//     FormFieldSetter<int> onSaved,
//     FormFieldValidator<int> validator,
//     int initialValue = 0,
//     bool autovalidate = false
//   }) : super(
//     onSaved: onSaved,
//     validator: validator,
//     initialValue: initialValue,
//     autovalidate: autovalidate,
//     builder: (FormFieldState<int> state) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.remove),
//             onPressed: () {
//               state.didChange(state.value - 1);
//             },
//           ),
//           Text(
//             state.value.toString()
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               state.didChange(state.value + 1);
//             },
//           ),
//         ],
//       );
//     }
//   );
// }

class _DrawerWidgetState extends State<NewActivityContentPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _age;

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Informe o nome da atividade:'),
                TextFormField(
                  autovalidate: false,
                  onSaved: (value) => this._name = value,
                  validator: (value) {
                    if (value.length < 5) {
                      return 'Nome deve ter mais de 5 caracteres';
                    }
                  },
                ),
                Text('Qual a DIFICULDADE da atividade?'),
                Counter(),
                
                Text('Qual o PESO da atividade na média final?'),
                Counter(),
                
                Text('Qual o seu CONHECIMENTO sobre o assunto?'),
                Counter(),
                
                Text('Quantas HORAS até a entrega da atividade?'),
                Counter(),
                
                
                RaisedButton(
                  child: Text('Criar'),
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
    );
  }
}

List<DataTest> listDataTestM = [
  DataTest(
      title: "LALALALALA",
      timeLeft: "3 dias 4 horas",
      weight: 10,
      evaluation: 10,
      color: Colors.green),
  DataTest(
      title: "Banco de Dados - Atividade I",
      timeLeft: "2 dias 1 hora",
      weight: 10,
      evaluation: 9,
      color: Colors.red),
  DataTest(
      title: "Mobile- Entrega Protótipo",
      timeLeft: "8 horas",
      weight: 10,
      evaluation: 10,
      color: Colors.yellow),
  DataTest(
      title: "Mobile- Entrega Diagramas",
      timeLeft: "8 horas",
      weight: 10,
      evaluation: 10,
      color: Colors.grey),
];

class DataTest {
  final String title;
  final String timeLeft;
  final int weight;
  final double evaluation;
  final Color color;

  DataTest(
      {this.title, this.timeLeft, this.weight, this.evaluation, this.color});
}
