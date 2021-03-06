import 'package:app_peliculas/src/pages/models/actores_model.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas/src/pages/models/pelicula_model.dart';
import 'package:app_peliculas/src/pages/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula =  ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar( pelicula ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0,),
                _posterTitulo( context, pelicula ),
                _descripcion( pelicula ),
                _crearCasting( pelicula ),
              ]
            )
          )
        ],
      )
    );
  }

  Widget _crearAppBar( Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.red,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text( 
            pelicula.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'), 
          image: NetworkImage(pelicula.getBackgroundImg()),
          fadeInDuration: Duration( milliseconds: 150 ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo( BuildContext context, Pelicula pelicula ) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20.0),
      child: Row(
        children: <Widget> [
          Hero(
            tag: pelicula.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child:
                Image(
                  image: NetworkImage( pelicula.getPosterImg()),
                  height: 150.0,
                )
            ),
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /* Text( pelicula.title, 
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,), */
                Container(
                  width: 200.0,
                  child: Text( 
                    pelicula.title,
                    style: TextStyle(
                      
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Text( pelicula.originalTitle, 
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,),
                Text( pelicula.releaseDate, 
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    Icon( Icons.star_border),
                    Text(pelicula.voteAverage.toString()),
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _descripcion( Pelicula pelicula ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        style: TextStyle( fontSize: 17.0),
      ) 
    );
  }

  Widget _crearCasting(  Pelicula pelicula ) {
    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        // print('aqui');
        // print(snapshot.data);
        if( snapshot.hasData )
          return _crearActorPageView( context, snapshot.data );
        else
          return Center( child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearActorPageView( BuildContext context, List<Actor> actores ){

    final _screenSize = MediaQuery.of(context).size;

    final _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.3,
    );

    _pageController.addListener( () {

      if (_pageController.position.pixels == _pageController.position.maxScrollExtent) {
        _pageController.position.animateTo(
          _pageController.position.minScrollExtent,
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
        );
      }
      
      if (_pageController.position.pixels == _pageController.position.minScrollExtent) {
        _pageController.position.animateTo(
          _screenSize.width * 0.3,
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
        );
      }
    } );

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: actores.length,
        itemBuilder: (context, i) {
          return _actorTarjeta(actores[i]);
        }
      ),
    );
  }

  Widget _actorTarjeta( Actor actor ) {

    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            // borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage( 
                placeholder: AssetImage('assets/img/no-image.png'), 
                image: NetworkImage( actor.getFoto() ), 
                height: 150,
                fit: BoxFit.cover,
            )
          ),
          // Text( actor.name, overflow: TextOverflow.ellipsis),
          Container(
            width: 90.0,
            child: Text(actor.name),
          ),
        ],
      ),
    );
  }

}