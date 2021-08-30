import 'package:flutter/material.dart';
import 'package:preferenciasdeusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasdeusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasdeusuarioapp/src/shared_prefs/preferencias_usuarios.dart';
 
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName      : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName : ( BuildContext context ) => SettingsPage(),
      },
    );
  }
}