import 'package:biblia_app/providers/menu_provider.dart';
import 'package:biblia_app/src/pages/capitulos.dart';
import 'package:flutter/material.dart';
// import 'package:biblia_app/src/utils/listas.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  static const todo = 'TODO';
  static const antiguo = 'AT';
  static const nuevo   = 'NT';

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400);

  final List<Widget> _widgetOptions = <Widget>[
    _lista( todo ),
    _lista( antiguo ),
    _lista( nuevo ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'La Biblia'),
        backgroundColor: Color.fromRGBO( 0, 51, 102, 1.0),
      ),
      body: Center(
        child: Stack(
          children: <Widget> [
            _fondoApp(),
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            // icon: Text('Todo', style: TextStyle(fontSize: 20.0),),
            icon: ImageIcon( 
              AssetImage('assets/icon/icono_bible.png'), 
              size: 35.0,
            ),
            // activeIcon: Text("a"),
            label: 'Todo'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icon/at.png'),
              size: 35.0,
            ),
            label: 'AT'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icon/nt.png'),
              size: 35.0,
            ),
            label: 'NT'
          ),
        ],
        // selectedItemColor: Colors.deepPurpleAccent,
        selectedItemColor: Color.fromRGBO(182, 149, 192, 1.0),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _fondoApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.4),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            // Colors.blueAccent,
            Color.fromRGBO(0, 90, 204, 1.0),
            Colors.lightGreen,
          ]
        )
      ),
    );
  }

  static Widget _lista( String nombre ) {
    return FutureBuilder(
        future: menuProvider.cargarData( nombre ),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  static List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['nombre'], style: optionStyle,),
        leading: ImageIcon( 
          AssetImage('assets/icon/list_icono.png'), size: 45.0,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, 
          Capitulos.routeName, 
          arguments: Argumentos( opt['nombre'], opt['ingles'], opt['capitulos']),
          );
        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }
}