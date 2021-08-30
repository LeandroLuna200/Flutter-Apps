import 'package:app_peliculas/src/pages/providers/peliculas_provider.dart';
import 'package:app_peliculas/src/pages/search/search_delegate.dart';
import 'package:app_peliculas/src/pages/widgets/card_swiper_widget.dart';
import 'package:app_peliculas/src/pages/widgets/movie_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas', style: GoogleFonts.roboto()),
        backgroundColor: Colors.red,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){
              showSearch(
                context: context, 
                delegate: DataSearch(),
                // query: 'Buscar una película'
              );
            }
          )
        ],
      ),
      /* body: SafeArea(
        child: Text('Hola mundo!!!!!!!!!!'),
      ) */
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if( snapshot.hasData ) {
          return CardSwiper(
            peliculas: snapshot.data, 
          );
        }else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      }
    );
    // peliculasProvider.getEnCines();
    /* return CardSwiper(
      peliculas: [1,2,3,4,5],
    ); */
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            padding: EdgeInsets.only(left: 20.0),

            child: Text('Peliculas populares', 
              style: GoogleFonts.lato()
            ), 
          ),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              // snapshot.data?.forEach( (p)=> print(p.title) );
              if( snapshot.hasData )
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              else
                return Center(child: CircularProgressIndicator()); 

            }, 
          ),
        ],
      ),
    );
  }
}