// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcohol = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();
  String _result = '';

  void _calculate() {
    double? alcoholPrice = double.tryParse(_controllerAlcohol.text);
    double? gasolinePrice = double.tryParse(_controllerGasoline.text);

    if (alcoholPrice == null || gasolinePrice == null) {
      setState(() {
        _result =
            'Número inválido, digite números maiores que 0 e utilizando ponto';
      });
    } else {
      if (alcoholPrice / gasolinePrice >= 0.7) {
        setState(() {
          _result = 'Melhor abastecer com gasolina.';
        });
      } else {
        setState(() {
          _result = 'Melhor abastecer com álcool.';
        });
      }
      _clearInputs();
    }
  }

  void _clearInputs() {
    _controllerAlcohol.text = '';
    _controllerGasoline.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álccol ou Gasolina'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset(
                'images/logo.jpg',
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Saiba qual a melhor opção para abastecimento do seu carro',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço álcool, ex: 4.60 ',
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerAlcohol,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço Gasolina, ex: 6.10 ',
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerGasoline,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: _calculate,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                _result,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
