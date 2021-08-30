// import 'package:biblia_app/models/versiculo_model.dart';
import 'package:biblia_app/providers/contenido_provider.dart';
import 'package:biblia_app/src/pages/capitulos.dart';
import 'package:flutter/material.dart';

class Versiculos extends StatelessWidget {

  static const routeName = '/versiculos';

  @override
  Widget build(BuildContext context) {

    final Argumentos args = ModalRoute.of(context).settings.arguments;
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text( args.texto + ' ${args.cantCap}'),
      ),
      body: Container(
        child: _crearTexto( args.ingles + '${args.cantCap}' ),),
    );
  }

  Widget _crearTexto(  String pasaje ) {
    final versProvider = new VersiculoProvider();

    return FutureBuilder(
      future: versProvider.getCapitulo( pasaje ),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if( snapshot.hasData )
          return _crearVersiculo( snapshot.data );
        else
          return Center( child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearVersiculo( String texto) {
    return SafeArea(
          child: SingleChildScrollView(
        child: Text(texto, style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}