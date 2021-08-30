import 'package:flutter/material.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    return Container(
      child: BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded),
            label: 'Direcciones'
          )
        ]
      ),
    );
  }
}