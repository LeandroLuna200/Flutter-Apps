import 'package:biblia_app/src/pages/versiculos.dart';
import 'package:flutter/material.dart';

class Argumentos {
  final String texto;
  final String ingles;
  final int cantCap;

  Argumentos( this.texto, this.ingles, this.cantCap);
}

class Capitulos extends StatelessWidget {

  static const routeName = '/capitulo';

  @override
  Widget build(BuildContext context) {

    final Argumentos args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.texto, 
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25.0),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: _crearItems( context, args.texto, args.ingles, args.cantCap ),
      )
    );
  }


  List<Widget> _crearItems( BuildContext context, String nom, String ing, int cant ) {
    final List<Widget> opciones = [];

    for( int i= 1; i<= cant; i++ ) {
      final widgetTemp = ListTile(
        title: Text( '$i', textAlign: TextAlign.center, ),
        // tileColor: Colors.blueGrey,
        onTap: () {
          Navigator.pushNamed(context, 
          Versiculos.routeName, 
          arguments: Argumentos( nom, ing, i),
          );
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    }

    return opciones;
  }
}
