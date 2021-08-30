import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget> [
          _pagina1(),
          _pagina2(),
        ],
      )
    );
  }

  Widget _pagina1() {
    return Stack(
      children: [
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(0, 204, 255, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image:  AssetImage('assets/image-1509.jpg'),
        fit: BoxFit.cover,
      )
    );
  }

  Widget _textos() {

    final estiloTexto = TextStyle(color: Colors.black, fontSize: 50.0, backgroundColor: Colors.white70);

    return Column(
      children: [
        SizedBox(height: 20.0,),
        Text('11°', style: estiloTexto,),
        Text('Miércoles', style: estiloTexto,),
        Expanded(child: Container()),
        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 70.0,)
      ],
    );
  }
  
  Widget _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Color.fromRGBO(204, 255, 240, 1.0),
      color: Colors.lightBlueAccent,
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text('Bieeenvenidos al Himalaya!', 
                        style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: () {},
        ),
      )
    );
  }
}