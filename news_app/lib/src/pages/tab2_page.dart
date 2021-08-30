import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_services.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget> [
            _ListaCategorias(),
            Expanded(
              child: ( newsService.categoryArticles[newsService.selectedCategory].isEmpty )
                ? Center( child: CircularProgressIndicator())
                : ListaNoticias(
                  newsService.getArticulosCategoriaSeleccionada
                ),
          
            )        
          ],
        ),
      )
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    List<String> categoriaLabel = [
      'Negocios',
      'Entretenimiento',
      'General',
      'Salud',
      'Ciencia',
      'Deporte',
      'Tecnologia',
    ];

    return Container(
      width: double.infinity,
      height: 75,
      // color: Colors.red,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // width: 120,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton( categories[index] ),
                  SizedBox(),
                  Text( categoriaLabel[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category categoria;

  const _CategoryButton( this.categoria );
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (){
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, 
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == this.categoria.name)
                 ? miTema.accentColor
                 : Colors.black,
        ),
      ),
    );
  }
}