import 'package:flutter/material.dart';

class AppGasolina extends StatefulWidget {
  const AppGasolina({super.key});

  @override
  State<AppGasolina> createState() => _AppGasolinaState();
}

class _AppGasolinaState extends State<AppGasolina> {
  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _alcoolController = TextEditingController();

  num? _resultValue;
  String _strResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              child: Text(
                "Gasolina vs Álcool",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 10, 20),
              child: Image.asset(
                'assets/images/foto.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _gasolinaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Digite o valor da gasolina",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _alcoolController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Digite o valor do álcool",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    _resultValue = double.parse(_gasolinaController.text) * 0.7;

                    if (_resultValue! >= double.parse(_alcoolController.text)) {
                      _strResult = "Abastecer com álcool";
                    } else {
                      _strResult = "Abastecer com gasolina";
                    }
                  });
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                _strResult,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
