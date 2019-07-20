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

  Widget _buildArticlesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.articles,
          emptyMessage: 'Нет статей',
        )
    );
  }

  Widget _buildFavoritesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.favoriteArticles,
          emptyMessage: 'Нет закладок'
        )
    );
  }

  Widget _buildBody() {
    switch(_currentIndex) {
      case 1: return _buildArticlesTabPage();
      case 2: return _buildFavoritesTabPage();
      case 3: return Settings();
      default: return ContentView(content);
    }
  }

  void _handleIndexChange(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  _buildSearchAction() {
    return Consumer<AppModel>(
      builder: (context, app, child) =>
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => showSearch(
            context: context,
            delegate: AppSearchDelegate(app.articles)
          )
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Конституция ПМР'),
        actions: <Widget>[
          _buildSearchAction()
          //_LanguagePopupMenuButton()
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: AppBottomNavigationBar(
        onIndexChange: _handleIndexChange
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