import 'package:biblia_app/src/pages/capitulos.dart';
import 'package:biblia_app/src/pages/home_page.dart';
import 'package:biblia_app/src/pages/versiculos.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblia App',
      initialRoute: '/',
      routes: {
        '/'                 : (BuildContext context) => HomePage(),
        Capitulos.routeName : (BuildContext context) => Capitulos(),
        Versiculos.routeName : (BuildContext context) => Versiculos(),
      },
    );
  }
}