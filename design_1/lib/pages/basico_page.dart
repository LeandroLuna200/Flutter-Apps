import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle( fontSize: 15.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
          child: Column(
            children: <Widget> [
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        )
      )
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
        'https://25.media.tumblr.com/c7b599cb500b900eb895adf5377c22c5/tumblr_mywvz1P0iZ1qa07aro1_1280.jpg'),
        // height: 400.0,
        // fit: BoxFit.cover,
        // width: 700.0,
    );
  }

  Widget _crearTitulo() { 
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget> [
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text('Chicago', style: estiloTitulo,),
                  SizedBox(height: 7.0,),
                  Text('Me gusta mucho esta zona', style: estiloSubtitulo),
                ],
              ),
            ),
            Icon( Icons.star, color: Colors.red, size: 25.0,),
            Text('41', style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _crearAccion(Icons.call, 'CALL'),
        _crearAccion(Icons.near_me, 'ROUTE'),
        _crearAccion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String texto) {
    return Column(
      children: <Widget> [
        Icon( icon, color: Colors.blue, size: 40.0,),
        SizedBox(height: 15.0,),
        Text( texto, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text('Ex adipisicing ut consectetur laborum aliquip sunt incididunt' 
      'nisi laborum et adipisicing ipsum sit. Ut eu fugiat eiusmod sunt anim' 
      'pariatur tempor anim. Reprehenderit fugiat dolore elit voluptate sint'
      'anim exercitation dolore ut in. Dolore sit fugiat duis incididunt sunt' 
      'aute reprehenderit do non.', textAlign: TextAlign.justify,),
    );
  }
}