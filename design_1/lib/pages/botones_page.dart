import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget> [
            _fondoApp(),

            SingleChildScrollView(
              child: Column(
                children: [
                  _titulos(),
                  _botonesRedondeados(),
                ] 
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
        ]
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Colors.black45,
            Colors.blue
          ]
        )
      ),
    );

    final caja = Transform.rotate(
      angle: -pi/4.0,
      child: Container(
        height: 360.0,
        width: 290.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(153, 204, 0, 1.0),
              Color.fromRGBO(204, 255, 204, 1.0),
            ]
          ),
        ),
      ),
    );

  
    return Stack(
      children: <Widget> [
        gradiente,
        Positioned(
          top   : -100,
          child : caja,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text('Titulo', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            Text('Categorias', style: TextStyle(color: Colors.white, fontSize: 30.0,),),
          ],
        ),
      ),
    );
  } 

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
           children: [
             _crearBotonRedondeado(Colors.blueAccent, Icons.border_all, 'Title'),
             _crearBotonRedondeado(Colors.blueAccent, Icons.access_alarm, 'Alarm'),
           ],
        ),
        TableRow(
           children: [
             _crearBotonRedondeado(Colors.blueAccent, Icons.account_box, 'Account'),
             _crearBotonRedondeado(Colors.blueAccent, Icons.wifi_rounded, 'Wifi'),
           ],
        ),
        TableRow(
           children: [
             _crearBotonRedondeado(Colors.blueAccent, Icons.add_a_photo_sharp, 'Photo'),
             _crearBotonRedondeado(Colors.blueAccent, Icons.add_location, 'Location'),
           ],
        )
      ],
    );
  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto) {
    return ClipRect(
      child: BackdropFilter(
        filter : ImageFilter.blur( sigmaX: 5.0, sigmaY: 5.0),
        child  : Container(
          height: 180.0,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO( 0, 204, 255, 0.6),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox( height: 5.0,),
              CircleAvatar( 
                backgroundColor: color,
                child: Icon( icono, color: Colors.white, size: 30.0,),
                radius: 35.0,
              ),
              Text(
                texto,
                style: TextStyle( color: Colors.black),
              ),
              SizedBox( height: 5.0,),
            ],
          ),
        ),
      ),
    );
  }

 /*  Widget _bottomNavigationBar(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme
        .copyWith( caption: TextStyle( color: Color.fromRGBO(
          116, 117, 152, 1.0)))
      ),

      child: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today),
            label: 'Calendario',
          ),
        ]
      ),
    );
  } */
}