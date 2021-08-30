import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTexto1 = new TextStyle(fontSize: 30, fontStyle: FontStyle.italic);

  final conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Este es el AppBar'),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.red,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Número de clicks:', style: estiloTexto1),
          Text('$conteo', style: estiloTexto1),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola Mundo');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
