import 'package:flutter/material.dart';
import 'dart:async';


class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = new List();
  int _ultNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if( _scrollController.position.pixels 
          == _scrollController.position.maxScrollExtent )
        // _agregar10();
        fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Stack(
        children: <Widget> [
          _crearLista(),
          _crearLoading(),
        ]
      )

    );
  }

  Widget _crearLista() {
    return RefreshIndicator(

        onRefresh: _obtenerPagina1,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: 
                  NetworkImage('https://picsum.photos/500/300?random=$imagen'));
          // NetworkImage('http://placekitten.com/500/300?image=$imagen'));
        },
      ),
    );
  }

  Future<void> _obtenerPagina1() {
    final duration = Duration( seconds: 2);
    new Timer(
      duration, (){
        _listaNumeros.clear();
        _ultNumero++;
        _agregar10();
      }
    );
    return Future.delayed(duration);
  }

  void _agregar10() {
    for( var i = 0; i < 10 ; ++i ) {
      _listaNumeros.add(_ultNumero);
      _ultNumero++;
    }
    setState(() {});
  }

  Future<Null> fetchData() async{

    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2 );
    return new Timer( duration, respuestaHTTP );
  }

  void respuestaHTTP(){
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration( milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );

    _agregar10();
  }

  Widget _crearLoading(){
    if( _isLoading )
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CircularProgressIndicator(),
            ],
          ),
          // SizedBox( height: 5.0),
        ],
      );
    else
      return Container();
  }

}
