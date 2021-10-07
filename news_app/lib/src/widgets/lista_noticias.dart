import 'package:flutter/material.dart';
import 'package:news_app/src/models/new_models.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:news_app/src/utils/utils.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(
            noticia: this.noticias[index],
            index: index,
          );
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia, index),

        _TarjetaTitulo(noticia),

        _TarjetaImagen(noticia),

        _TarjetaBody(noticia),

        // _TarjetaBotones(),

        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

// class _TarjetaBotones extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         RawMaterialButton(
//           onPressed: () {},
//           fillColor: miTema.accentColor,
//           child: Icon(Icons.star_border),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         RawMaterialButton(
//           onPressed: () {},
//           fillColor: Colors.blue,
//           child: Icon(Icons.share),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         )
//       ],
//     ));
//   }
// }

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: Text(
        noticia.description != null ? noticia.description : '',
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? InkWell(
                    onTap: () => launchURL(context, noticia),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/img/giphy.gif'),
                      image: NetworkImage(noticia.urlToImage),
                    ))
                : InkWell(
                    onTap: () => launchURL(context, noticia),
                    child:
                        Image(image: AssetImage('assets/img/no-image.png')))),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}
