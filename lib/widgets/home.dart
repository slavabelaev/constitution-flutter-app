import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../content/content_ru.dart';
import '../widgets/app_search_delegate.dart';
import '../widgets/content_view.dart';
import '../widgets/article_list_view.dart';
import '../models/app_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex;

  Widget buildArticlesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.articles,
          emptyMessage: 'Нет статей',
        )
    );
  }

  Widget buildFavoritesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.favoriteArticles,
          emptyMessage: 'Нет закладок'
        )
    );
  }

  Widget buildBodyWidget() {
    switch(_currentIndex) {
      case 1: return buildArticlesTabPage();
      case 2: return buildFavoritesTabPage();
      case 3: return Settings();
      default: return ContentView(content);
    }
  }

  void handleIndexChange(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Конституция ПМР'),
        actions: <Widget>[
          Consumer<AppModel>(
            builder: (context, app, child) =>
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: AppSearchDelegate(app.articles)
                )
              ),
          )
          //_LanguagePopupMenuButton()
        ],
      ),
      body: buildBodyWidget(),
      bottomNavigationBar: AppBottomNavigationBar(
        onIndexChange: handleIndexChange
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Темная тема'),
          trailing: Switch(value: true, onChanged: null),
        )
      ],
    );
  }
}