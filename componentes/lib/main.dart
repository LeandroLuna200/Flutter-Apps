import 'package:flutter/material.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
//import 'package:componentes/src/pages/home_temp.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());   

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'),
        const Locale('es', 'ES'),
      ],
      title: 'Componentes App',
      /* home: HomePage()); */
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
