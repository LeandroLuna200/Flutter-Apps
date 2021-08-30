import 'package:clima_app/services/location_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _crearPosicionActual(),
            ],
          ),
      ),
    );
  }

  Widget _crearPosicionActual() {
    return Container(

    );
  }

}