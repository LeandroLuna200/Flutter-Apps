import 'package:flutter/material.dart';
import 'package:preferenciasdeusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasdeusuarioapp/src/shared_prefs/preferencias_usuarios.dart';
import 'package:preferenciasdeusuarioapp/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = SettingsPage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.green : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${ prefs.genero }'),
          Divider(),
          Text('Nombre de Usuario: ${ prefs.nombre   }'),
          Divider(),
        ],
      ),
    );
  }
}