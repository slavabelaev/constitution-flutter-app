import 'package:flutter/foundation.dart';
import '../classes/preamble.dart';
import '../classes/article.dart';
import '../classes/section.dart';
import '../classes/amendment.dart';

class AppModel {
  final Preamble preamble;
  final List<Article> articles;
  final List<Section> content;
  final List<Amendment> amendments;
  List<Article> favoriteArticles = [];

  bool containsInFavorites(Article article) {
    return favoriteArticles.contains(article);
  }

  void addToFavorite(Article article) {
    favoriteArticles.add(article);
  }

  void removeFromFavorite(Article article) {
    favoriteArticles.remove(article);
  }

  void toggleFavorite(Article article) {

    if (containsInFavorites(article)) {
      favoriteArticles.remove(article);
    } else {
      favoriteArticles.add(article);
    }
  }

  AppModel({
    @required this.preamble,
    @required this.articles,
    @required this.content,
    @required this.amendments
  });
}