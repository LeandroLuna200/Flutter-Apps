import 'package:clima_app/services/location_service.dart';
import 'package:clima_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  final locationProvider = LocationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima App',
      home: HomePage(),
    );
  }
}