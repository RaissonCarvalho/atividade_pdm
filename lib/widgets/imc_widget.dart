import 'dart:math';

import 'package:flutter/material.dart';

class IMCWidget extends StatefulWidget {
  const IMCWidget({super.key});

  @override
  State<IMCWidget> createState() => _IMCWidgetState();
}

class _IMCWidgetState extends State<IMCWidget> {
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  num? _imcValue;
  String? _strResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura (m)",
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      _imcValue = double.parse(_pesoController.text) /
                          pow(double.parse(_alturaController.text), 2);

                      if (_imcValue! <= 18.6) {
                        _strResult = "Abaixo do peso";
                      } else if (_imcValue! > 18.6 && _imcValue! <= 24.9) {
                        _strResult = "Peso ideal";
                      } else if (_imcValue! > 24.9 && _imcValue! <= 29.9) {
                        _strResult = "Levemente acima do peso";
                      } else if (_imcValue! > 29.9 && _imcValue! <= 34.9) {
                        _strResult = "Obesidade grau I";
                      } else if (_imcValue! > 34.9 && _imcValue! <= 39.9) {
                        _strResult = "Obesidade grau II";
                      } else if (_imcValue! > 40) {
                        _strResult = "Obesidade grau III";
                      }
                    });
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            const Text(
              "Info",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                _imcValue == null
                    ? ""
                    : "${_strResult!} (${_imcValue!.toStringAsFixed(2)})",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
