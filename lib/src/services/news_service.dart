import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/category_model.dart';
import '../models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '0ba4adacd05b44a18dd92ff2c88b8f6b';
class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    getTopHeadlines();
  }

  get getSelectedCategory  => _selectedCategory;
  set setSelectedCategory(String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulesCategoriesSelected => categoryArticles[getSelectedCategory]!;

  getArticlesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));
    final newsResponse = News.fromJson(resp.body);
    categoryArticles[category]?.addAll(newsResponse.articles!);
    notifyListeners();
  }

  getTopHeadlines() async{
    const url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = News.fromJson(resp.body);
    headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }


}