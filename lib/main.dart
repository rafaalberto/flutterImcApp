import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ImcApp());

class ImcApp extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<ImcApp> {
  String infoText = "Informe seus dados";

  TextEditingController weigthController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }

  void _calculate() {
    double weigth = double.parse(weigthController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weigth / (height * height);

    setState(() {
      infoText = "IMC: $imc";
    });
  }

  void _resetFields() {
    setState(() {
      weigthController.text = "";
      heightController.text = "";
      infoText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Calculadora de IMC'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _resetFields();
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 170.0,
                  color: Colors.blue,
                ),
                buildTextField("Peso", weigthController),
                Divider(),
                buildTextField("Altura", heightController),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        _calculate();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    infoText,
                    style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
