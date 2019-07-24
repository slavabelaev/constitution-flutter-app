import 'package:flutter/foundation.dart';
import '../classes/article.dart';

class FavoritesModel with ChangeNotifier {
  List<Article> articles = [];

  bool contains(Article article) {
    return articles.contains(article);
  }

  void toggle(Article article) {
    if (contains(article)) {
      articles.remove(article);
    } else {
      articles.add(article);
    }
    notifyListeners();
  }
}