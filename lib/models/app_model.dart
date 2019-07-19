import '../classes/article.dart';

class AppModel {
  List<Article> articles = [];
  List<Article> favoriteArticles = [];

  void addToFavorite(Article article) {
    favoriteArticles.add(article);
  }

  void toggleFavorite(Article article) {

    if (containsInFavorites(article)) {
      favoriteArticles.remove(article);
    } else {
      favoriteArticles.add(article);
    }

    print(containsInFavorites);
  }

  bool containsInFavorites(Article article) {
    return favoriteArticles.contains(article);
  }

  void removeFromFavorite(Article article) {
    favoriteArticles.remove(article);
  }

  AppModel(this.articles);
}