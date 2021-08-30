import 'package:app_peliculas/src/pages/models/pelicula_model.dart';
import 'package:app_peliculas/src/pages/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  final peliculas = [
    'luna',
    'LUNA',
    'leandro',
    'leandrooo',
    'santiagO',
  ];

  final peliculasRecientes = [
    'leandro',
    'santiago',
    'luna'
  ];

  String seleccion = '';

  final peliculasProvider = new PeliculasProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
      // LAS ACCIONES DE NUESTRA APPBAR
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          }
        )
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      // ICONO A LA IZQ DEL APPBAR
      return IconButton(
        icon:AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), 
        onPressed: (){
          close(
            context, 
            null
          );
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // CREA LOS RESULTADOS QUE VAMOS A MOSTRAR
      return Center(
        child: Container(
          // height: 100.0,
          // width: 100.0,
          // color: Colors.redAccent,
          // child: Text( seleccion ),
        ),
      );
    } 
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // SON LAS SEGUERENCIAS QUE APARECEN

    if( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if( snapshot.hasData ){
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map( (pelicula) {
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.png'), 
                  image: NetworkImage( pelicula.getPosterImg()),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text( pelicula.title ),
                subtitle: Text(pelicula.overview, overflow: TextOverflow.ellipsis,),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        }else
          return Center( child: CircularProgressIndicator(),);
        
      },
    );
  }

  /* @override
    Widget buildSuggestions(BuildContext context) {
    // SON LAS SEGUERENCIAS QUE APARECEN

    final listaSugerida = ( query.isEmpty )
                          ? peliculasRecientes
                          : peliculas.where(
                            (p) => p.toLowerCase().startsWith(query.toLowerCase()) 
                            ).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: () {
            seleccion = listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  } */

}