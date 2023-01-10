import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frases_do_dia/Strings.dart';
import 'package:frases_do_dia/Images.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  var _frases = [
    Strings.frase_1,
    Strings.frase_2,
    Strings.frase_3,
    Strings.frase_4,
  ];

  var _fraseGerada = Strings.frase_0;
  
  void _gerarFrase(){

    // 0, 1 , 2, 3
    var numeroSorteado = Random().nextInt( _frases.length );

    setState(() {
      _fraseGerada = _frases[ numeroSorteado ];
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Images.logo
            ),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            ElevatedButton(
              child: Text(
                "Nova frase",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: _gerarFrase,
            ),
          ],
        ),
      ),
    );
  }
}