import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classes/uid.dart';
import '../classes/article.dart';

class FavoritesModel with ChangeNotifier {
  FavoritesModel() {
   _load();
  }

  List<Uid> itemIds = [];

  bool contains(Uid id) {
    return itemIds.where((item) => item.uid == id.uid).isNotEmpty;
  }

  void _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList('favoriteIds').forEach(
      (item) => itemIds.add(Uid(item))
    );
    notifyListeners();
  }

  List<Article> filter(List<Article> articles) {
    return articles.where(
      (article) => contains(article.uid)
    ).toList();
  }

  void _save(List<Uid> itemIds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = itemIds.map((item) => item.uid).toList();
    prefs.setStringList('favoriteIds', favoriteIds);

    notifyListeners();
  }

  void remove(Uid id) {
    itemIds.removeWhere((item) => item.uid == id.uid);
  }

  void add(Uid id) {
    itemIds.add(id);
  }

  void toggle(Uid id) {
    contains(id) ? remove(id) : add(id);
    _save(itemIds);
  }
}