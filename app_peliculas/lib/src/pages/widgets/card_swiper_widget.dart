import 'package:flutter/material.dart';
import 'package:app_peliculas/src/pages/models/pelicula_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper( { @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      // padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: _screenSize.height * 0.5,

      child: Swiper(
        layout: SwiperLayout.DEFAULT,
        // itemWidth: _screenSize.width * 0.50,
        // itemHeight: _screenSize.height * 0.20,

        itemBuilder: (BuildContext context, int index){

          peliculas[index].uniqueId = '${ peliculas[index].id }-tarjeta';

          return Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black, blurRadius: 10.0, spreadRadius: 1.0)
            ]),
            child: Hero(
              tag: peliculas[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: 
                  GestureDetector(
                    child: FadeInImage(
                      image: NetworkImage( peliculas[index].getPosterImg()),
                      placeholder: AssetImage('assets/img/no-image.png'),
                      fit: BoxFit.cover, 
                      // height: 5.0,
                    ),
                    onTap: (){
                      timeDilation = 1.5;
                      Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]);

                    },
                  ),
              ),
            ),
          );
        },
        itemCount: peliculas.length,
        viewportFraction: 0.65,
        scale: 0.8,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}