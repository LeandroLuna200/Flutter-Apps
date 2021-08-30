import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/new_models.dart';
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org/v2';
final _apiKey = '2968a8cc518541f69120001497b1a653';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};  

  NewsService(){
    this.getTopHeadlines();

    categories.forEach((element) {
      this.categoryArticles[element.name]  = [];
    });
    this.getArticlesByCategory(this._selectedCategory);
  }

  get selectedCategory => this._selectedCategory;

  set selectCategory(String valor ){

    this._selectedCategory = valor;

    this.getArticlesByCategory( valor );

    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada
    => this.categoryArticles[ this.selectedCategory];  


  getTopHeadlines() async {
    
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=ar';
    
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson( resp.body );

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory( String categoria) async {
    if( this.categoryArticles[categoria].length > 0 )
      return this.categoryArticles[categoria];

    final url = 
      '$_urlNews/top-headlines?apiKey=$_apiKey&country=ar&category=$categoria';
    
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson( resp.body );

    this.categoryArticles[categoria].addAll(newsResponse.articles);

    notifyListeners();
  }

}