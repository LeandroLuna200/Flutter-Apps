import 'package:flutter/material.dart';
import 'package:lector_qr/pages/home_page.dart';
import 'package:lector_qr/pages/mapa_page.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider())
      ],
      child: MaterialApp(
        title: 'Lector QR',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => HomePage(),
          'mapa' : ( _ ) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.blue[700],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[700]
          )
        ),
      ),
    );
  }
}