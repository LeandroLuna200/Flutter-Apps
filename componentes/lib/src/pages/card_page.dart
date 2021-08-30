import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blueAccent,
            ),
            title: Text("Titulo de la tarjeta"),
            subtitle:
                Text('Este es el subitutlo de la tarjeta que estoy creando'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: <Widget>[
              FlatButton(onPressed: null, child: Text('Cancelar')),
              FlatButton(onPressed: null, child: Text('Ok'))
          ])
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://wonderfulengineering.com/wp-content/uploads/2016/01/Chicago-Wallpaper-14.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover,
        ),

        /* Image(
          image: NetworkImage(
              'https://wonderfulengineering.com/wp-content/uploads/2016/01/Chicago-Wallpaper-14.jpg'),
        ), */

        Container(
          child: Text(
            'Chicago',
            style: TextStyle(fontSize: 25.0),
          ),
          padding: EdgeInsets.all(15.0),
        )
      ]),
    );

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(20.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12, blurRadius: 10.0, spreadRadius: 20.0)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: card,
        ));
  }
}
